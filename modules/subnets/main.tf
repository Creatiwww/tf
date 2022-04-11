resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  # Enabling automatic public IP assignment on instance launch!
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.tag_name
  }
}
