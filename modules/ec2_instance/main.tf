resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = var.user_data
  key_name               = var.key_name # ✅ Added key pair association

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg"
  vpc_id      = var.vpc_id # 🔥 Ensure this variable is defined

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
