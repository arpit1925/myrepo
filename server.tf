provider "aws" {
region = "us-west-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.micro"
  key_name = "raman-import"

  tags = {
    Name = "Arpit-DevOps-Synechron-batch-server"
    env = "production"
    owner = "Arpit"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}
