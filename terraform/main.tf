# Primary Region: us-east-1
module "primary_network" {
  source = "./modules/network"
  providers = {
    aws = aws.primary
  }

  app_name = var.app_name
}

module "primary_compute" {
  source = "./modules/compute"
  providers = {
    aws = aws.primary
  }

  app_name          = var.app_name
  vpc_id            = module.primary_network.vpc_id
  public_subnet_ids = module.primary_network.public_subnet_ids
  instance_count    = 1
  ami_id            = data.aws_ami.amazon_linux_primary.id
  user_data         = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from ${var.app_name} Primary Region (us-east-1)</h1>" > /var/www/html/index.html
              EOF
}

module "primary_database" {
  source = "./modules/database"
  providers = {
    aws = aws.primary
  }

  app_name = var.app_name
}

# Secondary Region: eu-north-1 (Stockholm) - Pilot Light
module "secondary_network" {
  source = "./modules/network"
  providers = {
    aws = aws.secondary
  }

  app_name = var.app_name
}

module "secondary_compute" {
  source = "./modules/compute"
  providers = {
    aws = aws.secondary
  }

  app_name          = var.app_name
  vpc_id            = module.secondary_network.vpc_id
  public_subnet_ids = module.secondary_network.public_subnet_ids
  instance_count    = 0  # Pilot light: ALB exists but no EC2 instances
}

module "secondary_database" {
  source = "./modules/database"
  providers = {
    aws = aws.secondary
  }

  app_name = var.app_name
}

# AMI Data Sources
data "aws_ami" "amazon_linux_primary" {
  provider    = aws.primary
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

data "aws_ami" "amazon_linux_secondary" {
  provider    = aws.secondary
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
