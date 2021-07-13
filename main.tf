terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
  }
  required_version = "~> 1.0.2"

  backend "remote" {
    organization = "example-org-6179d9"

    workspaces {
      name = "learn-terraform-github-actions"
    }
  }
}
provider "aws" {
  region  = "us-west-2"
  profile = "ci_github"
}

resource "aws_instance" "app_server" {
  ami           = "ami-270f9747"
  instance_type = "t2.micro"

  tags = {
    Name = "GitHub generated instance"
  }
}
