# terraform_example/test02_basic/operator/main.tf

variable "env" {
    default = "dev"
}

locals {
  instance_type = var.env == "dev" ? "t3.micro" : "t2.large"
}

output "debug" {
    value = "instance_type is ${local.instance_type}"
}