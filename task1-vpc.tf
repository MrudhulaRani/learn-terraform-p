resource "aws_vpc" "task-vpc1" {
  cidr_block = "${var.cidr}"
  tags {
    Name="task-vpc1"
  }
}