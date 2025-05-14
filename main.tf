module "vpc" {
  source             = "./modules/vpc"
  name               = "my-custom-vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  instance_name = var.instance_name
  instance_type = var.instance_type
  ami_id        = var.ami_id
  user_data     = file("install_nginx.sh")
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
  key_name      = var.key_name 
}


