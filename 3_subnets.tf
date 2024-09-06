resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "skillsync-public-subnet-A"
  }
}

resource "aws_subnet" "bastion-public-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "skillsync-bastion-public-subnet-B"
  }
}

resource "aws_subnet" "web-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "skillsync-web-private-subnet-A"
  }
}

resource "aws_subnet" "web-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "skillsync-web-private-subnet-B"
  }
}

resource "aws_subnet" "app-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "skillsync-app-private-subnet-A"
  }
}

resource "aws_subnet" "app-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "skillsync-app-private-subnet-B"
  }
}
