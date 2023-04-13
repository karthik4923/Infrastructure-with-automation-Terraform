resource "aws_instance" "myFirstInstance4923" {
ami="ami-06e46074ae430fba6"
count=1
key_name = "hero"
instance_type = "t2.micro"
security_groups= ["security_jenkins"]
tags={
Name = "success_host_inst"
}
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  yum install unzip
  wget https://www.tooplate.com/zip-templates/2113_earth.zip
  unzip 2113_earth.zip
  cp -r 2113_earth/* /var/www/html/
  systemctl start httpd
  systemctl enable httpd
  EOF
}
resource "aws_security_group" "inst_sec0000urity" {
name= "intst_sec0000urity" 
description = "security group for jenkins"
ingress{
from_port= 8080
to_port = 8080
protocol= "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress{
from_port = 0
to_port= 65535
protocol = "tcp" 
cidr_blocks = ["0.0.0.0/0"]
}
ingress{
from_port   = 0
to_port     = 65535
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
tags={
Name = "security_jenkins_port"
}
}