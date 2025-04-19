output "ec2_instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_instance.public_ip
}

output "vpc_id" {
  description = "VPC ID created by the VPC module"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "Public Subnet ID created by the VPC module"
  value       = module.vpc.public_subnet_id
}

