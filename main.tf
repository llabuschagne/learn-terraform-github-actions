terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = "~> 1.0.2"
}

provider "aws" {
  profile = "awml"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-270f9747"
  instance_type = "t2.micro"

  tags = {
    Name = "GitHub generated instance"
  }
}
