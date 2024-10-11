resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.18.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.18.2.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "private-subnet"
  }
}
