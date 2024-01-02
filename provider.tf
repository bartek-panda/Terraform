provider "aws" {
    region="us-east-1"
    }
# wersjonowanie providera i terraforma
terraform {
    backend "s3" {
     bucket = "bartlomiej-zdunek-panda-devops-core-16"
     key = "infre/terraform.state"
     region = "us-east-1"
}
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.33"
        }
    }
    required_version = ">=1.0.0"
}
