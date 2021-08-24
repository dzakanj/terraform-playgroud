provider "aws" {
    region = "eu-west-3"
}

variable "subnet_cidr_block" {
  type        = string
  description = "description"
}

variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for vpc subnet"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
      Name: "cidr block for vpc"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "eu-west-3a"
  tags = {
      Name: "subnet-1-dev"
  }
}