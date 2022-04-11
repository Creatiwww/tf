# ==================== NETWORK =========================

module "vpc" {
  source = "../../modules/vpc"

  cidr_block = "10.0.0.0/16"
}

module "subnet_public" {
  source = "../../modules/subnets"

  vpc_id                  = module.vpc.aws_vpc_id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tag_name                = "Public-subnet"
}

resource "aws_route_table_association" "RT-IG-Association" {
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = module.vpc.aws_route_table_id
}

# ==================== SERVERS =========================

locals {
  key_name = "AWS_Jenkins_Master_Key"
}

module "jenkins_master_key_pair" {
  source = "../../modules/key-pair"

  key_name = local.key_name
}

module "jenkins_master" {
  source = "../../modules/instance"

  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  subnet_id     = module.subnet_public.subnet_id
  tag_name      = "Jenkins Master"
  key_name      = local.key_name
  vpc_id        = module.vpc.aws_vpc_id
}
