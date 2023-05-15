##############Create a new VPC#################
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

###############Create an internet gateway################
resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

################Create a subnet within the VPC###############
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}
