resource "aws_instance" "wordpress" {
  ami           = "ami-xxxxxxxx"  # 適切なAMI IDに置き換えてください
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "wordpress-ec2"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
              yum install -y httpd mariadb-server
              systemctl start httpd
              systemctl enable httpd
              EOF
}
