#vpc

resource "aws_vpc" "project9-vpc" {
  cidr_block       = var.pro9-vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "project9-vpc"
  }
}

#public-subnets

resource "aws_subnet" "project9-pub-sub1" {
  vpc_id     = aws_vpc.project9-vpc.id
  cidr_block = var.pro9-pub-subnet-cidr
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "project9-pub-sub1"
  }
}

resource "aws_subnet" "project9-pub-sub2" {
  vpc_id     = aws_vpc.project9-vpc.id
  cidr_block = var.pro9-public-subnet-cidr
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "project9-pub-sub2"
  }
}

#private-subnets

resource "aws_subnet" "project9-private-sub1" {
  vpc_id     = aws_vpc.project9-vpc.id
  cidr_block = var.pro9-private-sub-cidr
  availability_zone = "eu-west-2a"
  tags = {
    Name = "project9-private-sub1"
  }
}

resource "aws_subnet" "project9-private-sub2" {
  vpc_id     = aws_vpc.project9-vpc.id
  cidr_block = var.proj9-private-sub-cidr
  availability_zone = "eu-west-2b"
  tags = {
    Name = "project9-private-sub2"
  }
}


#internet gateway

resource "aws_internet_gateway" "project9-igw" {
  vpc_id = aws_vpc.project9-vpc.id

  tags = {
    Name = "project9-igw"
  }
}


#public rout table
resource "aws_route_table" "project9-pub-rt" {
  vpc_id = aws_vpc.project9-vpc.id

  route = []

  tags = {
    Name = "project9-pub-rt"
  }
}

#private route table

resource "aws_route_table" "project9-private-rt" {
  vpc_id = aws_vpc.project9-vpc.id

  route = []

  tags = {
    Name = "project9-private-rt"
  }
}


#public route table association subnet

resource "aws_route_table_association" "project9-pubrt-asso1" {
  subnet_id      = aws_subnet.project9-pub-sub1.id
  route_table_id = aws_route_table.project9-pub-rt.id
}

resource "aws_route_table_association" "project9-pubrt-asso2" {
  subnet_id      = aws_subnet.project9-pub-sub2.id
  route_table_id = aws_route_table.project9-pub-rt.id
}

#private route table asocciation subnet

resource "aws_route_table_association" "project9-private-rt-asso1" {
  subnet_id      = aws_subnet.project9-private-sub1.id
  route_table_id = aws_route_table.project9-private-rt.id
}

resource "aws_route_table_association" "project9-private-rt-asso2" {
  subnet_id      = aws_subnet.project9-private-sub2.id
  route_table_id = aws_route_table.project9-private-rt.id
}

#route

resource "aws_route" "project9-route" {
  route_table_id = aws_route_table.project9-pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.project9-igw.id
}