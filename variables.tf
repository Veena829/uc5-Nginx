variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}
