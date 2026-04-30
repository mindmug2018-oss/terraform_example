# terraform_example/test02_basic/locals2/variables.tf

variable "env" {
    type = string
    description = "current environment (dev | prod)"
}

variable "project_name" {
    type = string
    description = "project name"
    default = "sample"
}

