terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "workshop-march-state-locking-table-aluno-01"
    key          = "networking/terraform.tfstate"
    use_lockfile = true
    region       = "us-east-1"

    # dynamodb_table = "workshop-march-state-locking-table"
  }
}

provider "aws" {
  region = var.assume_role.region

  default_tags {
    tags = var.tags
  }

  assume_role {
    role_arn = var.assume_role.arn
  }
}
