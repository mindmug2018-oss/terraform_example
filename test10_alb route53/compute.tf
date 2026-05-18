# ~/terraform_example/test08_autoscale2/compute.tf


# ec2 및 Auto Scaling Group


# 1. SSH 키 페어 생성 (TLS 라이브러리 활용)
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "kp" {
  key_name   = "lecture-key"
  public_key = tls_private_key.pk.public_key_openssh
}


resource "local_file" "ssh_key" {
  filename        = "${path.module}/lecture-key.pem"
  content         = tls_private_key.pk.private_key_pem
  file_permission = "0600"
}


# 2. 보안 그룹 (ASG용)
resource "aws_security_group" "asg_sg" {
  name   = "allow-ssh-http"
  vpc_id = aws_vpc.main.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# 3. 최신 Amazon Linux 2023 AMI 조회
data "aws_ami" "latest_al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}


resource "aws_instance" "my_ec2" {
  count = var.ec2_count
  ami = data.aws_ami.latest_al2023.id
  instance_type = var.instance_type
  subnet_id = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id][count.index % 2]
  vpc_security_group_ids = [aws_security_group.asg_sg.id]
  key_name = aws_key_pair.kp.key_name
  user_data = <<-EOF
    #!/bin/bash
    # 1. Nginx 
    dnf update -y
    dnf install -y nginx
    systemctl start nginx
    systemctl enable nginx

    # 2. html
    # count.index
    echo "<h1>Hello from EC2 Instance ${count.index}</h1>" > /usr/share/nginx/html/index.html
    echo "<p>available (Subnet): ${count.index % 2 == 0 ? "Public-A" : "Public-B"}</p>" >> /usr/share/nginx/html/index.html
    echo "<p>Hostname: $(hostname)</p>" >> /usr/share/nginx/html/index.html
  EOF
}

output "instance_public_ip" {
  description = "ec2 public id"
  value = aws_instance.my_ec2[*].public_ip  
}