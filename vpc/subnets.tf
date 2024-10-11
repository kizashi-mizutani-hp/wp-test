resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.18.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "wp-test-public-subnet-1a"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.18.2.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "wp-test-public-subnet-1c"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.18.3.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "wp-test-private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.18.4.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "wp-test-private-subnet-1c"
  }
}
