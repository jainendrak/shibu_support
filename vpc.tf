#code to create VPC
resource "aws_vpc" "VPC" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
}

#code to create Subnet
locals {
  private_subnet_IP = cidrsubnet(aws_vpc.VPC.cidr_block, 8, 0)
  public_subnet_IP = cidrsubnet(aws_vpc.VPC.cidr_block, 8, 1)

}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.VPC.id
    cidr_block = local.private_subnet_IP
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.VPC.id
    cidr_block = local.public_subnet_IP
    map_public_ip_on_launch = true
  
}

resource "aws_internet_gateway" "VPC_igw" {
    vpc_id = aws_vpc.VPC.id
  
}
resource "aws_default_route_table" "VPC_default_RT" {
    default_route_table_id = aws_vpc.VPC.default_route_table_id
    route = []
}