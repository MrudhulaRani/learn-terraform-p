output "my-vpc1" {
  value = "${aws_vpc.task-vpc1.id}"
}

output "my-vpc1-cidr" {
  value = "${aws_vpc.task-vpc1.cidr_block}"
}

output "subnet-arn" {
  value = "${aws_subnet.task1-sn.arn}"
}
output "public_ip" {
  value = "${aws_instance.task-ec2.public_ip}"
}