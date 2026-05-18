# terraform_example/test08_autoscale/compute.tf

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

resource "aws_launch_template" "lt" {
    name_prefix = "lecture-asg-"
    image_id = data.aws_ami.latest_al2023.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.asg_sg.id]
    key_name = aws_key_pair.kp.key_name

    user_data = base64encode(<<-EOF
        #!/bin/bash
        dnf update -y
        dnf install -y nginx
        systemctl enable --now nginx
        echo "<h1>Hello from ASG Instance</h1>" > /usr/share/nginx/html/index.html
    EOF
    )

    tag_specifications {
        resource_type = "instance"
        tags = { Name = "asg-instance" }
    }
}

resource "aws_autoscaling_group" "asg" {
    name = "lecture-asg"
    vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    desired_capacity = var.desired_capacity
    max_size = var.max_size
    min_size = var.min_size
    launch_template {
        id = aws_launch_template.lt.id
        version = "$Latest"
    }
}

data "aws_instances" "asg_nodes" {
  # ASG가 먼저 생성되어야 된다 
  # ASG 생성이 완료될 때까지 이 조회를 기다리도록 순서를 강제합니다.
  depends_on = [aws_autoscaling_group.asg]

  # 필터링 조건: 수많은 인스턴스 중 어떤 녀석을 골라낼지 정합니다.
  instance_tags = {
    # AWS가 ASG 소속 인스턴스에 자동으로 붙여주는 "소속 태그"를 이용합니다.
    # "이 ASG 이름(lecture-asg)을 가진 그룹에 속한 애들 다 모여!" 라는 뜻입니다.
    "aws:autoscaling:groupName" = aws_autoscaling_group.asg.name
  }

  # 상태 필터: 꺼져 있거나(stopped) 생성 중인 애들은 빼고, 
  # 지금 바로 접속해서 일할 수 있는 'running' 상태인 애들만 쏙 골라냅니다.
  instance_state_names = ["running"]
}

output "asg_instance_ips" {
  description = "Auto Scaling Group 인스턴스들의 Public IP"
  value       = data.aws_instances.asg_nodes.public_ips
}
