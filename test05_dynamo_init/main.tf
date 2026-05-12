# terraform_example/test05_dynamo_init/main.tf

terraform {
  required_version = "~>1.14.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}


resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute{
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "Terraform State Lock Table"
    }  
}