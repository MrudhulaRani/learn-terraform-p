resource "aws_instance" "task-ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.task1-sn.id}"
  key_name = "cli"
  security_groups = ["${aws_security_group.task1-sg.id}"]
  user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y
                service httpd start
                EOF
  tags {
    Name="ec2-${var.project}"
  }

}
