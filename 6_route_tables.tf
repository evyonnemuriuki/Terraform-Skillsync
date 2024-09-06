// public subnet route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "skillsync-public-route-table"
  }
}
// public subnet route table association
resource "aws_route_table_association" "public-subnet_a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-route-table.id
}

// bastion subnet
resource "aws_route_table" "bastion-public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "skillsync-bastion-public-route-table"
  }
}
// bastion subnet association
resource "aws_route_table_association" "bastion-subnet-b" {
  subnet_id      = aws_subnet.bastion-public-b.id
  route_table_id = aws_route_table.bastion-public-route-table.id
}

// web subnets route table
resource "aws_route_table" "web-private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a.id
  }

  tags = {
    Name = "skillsync-web-private-route-table"
  }
}
// web subnets route table association
resource "aws_route_table_association" "web-private-subnet-a" {
  subnet_id      = aws_subnet.web-private-a.id
  route_table_id = aws_route_table.web-private-route-table.id
}

resource "aws_route_table_association" "web-private-subnet-b" {
  subnet_id      = aws_subnet.web-private-b.id
  route_table_id = aws_route_table.web-private-route-table.id
}

// app subnet route table
resource "aws_route_table" "app-private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a.id
  }

  tags = {
    Name = "skillsync-app-private-route-table"
  }
}
// app subnet route table association
resource "aws_route_table_association" "app-private-subnet-a" {
  subnet_id      = aws_subnet.app-private-a.id
  route_table_id = aws_route_table.app-private-route-table.id
}

resource "aws_route_table_association" "app-private-subnet-b" {
  subnet_id      = aws_subnet.app-private-b.id
  route_table_id = aws_route_table.app-private-route-table.id
}