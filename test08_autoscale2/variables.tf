# terraform_example/test08_autoscale/variables.tf

# 변수 정의 
variable "region" { default = "ap-northeast-2" }
variable "instance_type" { default = "t3.micro" }
variable "desired_capacity" { default = 2 }
variable "min_size" { default = 1 }
variable "max_size" { default = 5 }

variable "avail_zone_1" { default = "ap-northeast-2a" }
variable "avail_zone_2" { default = "ap-northeast-2c" }