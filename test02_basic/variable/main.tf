# test02_basic/variable/main.tf 파일


# variable 사용해 보기


# project_name 이라는 변수를 만들어서 기본값 "lecture" 를 대입
variable "project_name" {
    default = "lecture"
}


# env 라는 이름의 변수를 만들어서 기본값  "dev" 를 대입
variable "env" {
    default = "dev"
}

variable "vpc_name" {
    type = string
    description = "vpc name created"
    default = "lecture-vpc"
}

variable "instance_count" {
    type = number
    description = "created new instance"
    default = 3
}

# List
variable "avail_zones" {
    type = list(string)
    description = "these are the used regions"
    default = [ "ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2d" ]
}

# 변수에 저장된 내용 출력하기
output "debug01_project_name" {
    # 변수 참조 하는 방법 ->  var.변수명
    value = var.project_name
}

# Map
variable "common_tags" {
    type = map(string)
    description = "all list shown"
    default = {
      env = "dev"
      project = "terraform-study"
      owner = "chihiro"
    }
}

variable "is_production" {
    type = bool
    description = "environment true, no environment will be entered false"
    default = false
}

output "debug02_env" {
    value = var.env
}

output "debug03_info" {
    value = "프로젝트명: ${var.project_name} , environment : ${var.env}"
}

output "debug04_vpc_name" {
    value = "vpc name : ${var.vpc_name}"
}

output "debug04_count" {
    value = "instance count : ${var.instance_count}"
}

output "debug06_list_all" {
    value = join(",", var.avail_zones)
}

output "debug07_map_value" {
    value = "this project environment is ${var.common_tags.env}"
}

output "debug07_map_value2" {
    value = "this project environment is ${var.common_tags["owner"]}"
}