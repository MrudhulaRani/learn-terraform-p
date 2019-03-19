output "my-vpc1" {
  value = "${aws_vpc.task-vpc1.id}"
}

output "my-vpc1-cidr" {
  value = "${aws_vpc.task-vpc1.cidr_block}"
}