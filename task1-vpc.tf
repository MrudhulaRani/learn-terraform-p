resource "aws_vpc" "task-vpc1" {
  cidr_block = "${var.cidr}"
  tags {
    Name="vpc-${var.project}"
  }
}

resource "aws_internet_gateway" "task1-igw" {
  vpc_id = "${aws_vpc.task-vpc1.id}"
  tags {
    Name="igw-${var.project}"
  }
}

resource "aws_subnet" "task1-sn" {
  cidr_block = "${var.sn-cidr}"
  vpc_id = "${aws_vpc.task-vpc1.id}"
  availability_zone = "${var.az}"
  map_public_ip_on_launch = true
  tags {
    Name="sn-${var.project}"
  }
}

resource "aws_route_table" "task1-rt" {
  vpc_id = "${aws_vpc.task-vpc1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.task1-igw.id}"
  }
  tags {
    Name="rt-${var.project}"
  }
}

resource "aws_route_table_association" "task1-rt-ass" {
  route_table_id = "${aws_route_table.task1-rt.id}"
  subnet_id = "${aws_subnet.task1-sn.id}"
}

resource "aws_security_group" "task1-sg" {
  name="${var.project}"
  vpc_id = "${aws_vpc.task-vpc1.id}"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name="sg-${var.project}"
  }

}