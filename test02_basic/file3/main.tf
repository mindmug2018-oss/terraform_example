variable "info" {
    description = "This is the informtion for one person"
    default = {
        num = 1
        name = "chihiro"
        body = {
            height = 180
            weight = 80
            blood = "O type"
        }
        hobby = ["programming", "piano", "movie"]
    }
}

output "debug01" {
    value = yamlencode({ info = var.info })
}

variable "ec2_ip" {
    description = "Lecturer's ec2 public ip"
    default = "111.111.222.222"
}

resource "local_file" "ansible_inventory" {
    filename = "${path.module}/inventory.yml"
    content = yamlencode({
        all = {
            hosts = {
                "${var.ec2_ip}" = {
                    ansible_user                    = "ec2-user"
                    ansible_ssh_private_key_file    = "${path.module}/lecture-key.pem"
                }
            }
        }
    })
}