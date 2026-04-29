terraform {
  required_version = "~>1.14.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_vpc" "test_vpc" {
    cidr_block = "10.0.1.0/24"
    enable_dns_hostnames = true
    enable_dns_support = true 
    tags = {
        Name = "terraform_test_vpc"
    }
}

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.test_vpc.id
    tags = {
        Name = "test_vpc_igw"
    }
}