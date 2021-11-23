#instances 

resource "aws_instance" "webserver1-project9" {
  ami           = var.pro9-AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project9-sg.id]
  subnet_id = aws_subnet.project9-pub-sub1.id
  availability_zone = "eu-west-2a"
  user_data = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver2-project9" {
  ami           = var.pro9-AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project9-sg.id]
  subnet_id = aws_subnet.project9-pub-sub2.id
  availability_zone = "eu-west-2b"


  tags = {
    Name = "HelloWorld"
  }
}

