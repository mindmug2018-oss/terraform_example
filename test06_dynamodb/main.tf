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


resource "aws_dynamodb_table" "members" {
    name = "members"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "num"
    attribute{
        name = "num"
        type = "N"
    }
    tags = {
        Name = "members TABLE"
    }  
}