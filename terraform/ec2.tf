resource "aws_instance" "client" {
  ami           = "ami-0d18e50ca22537278"
  instance_type = "t3.micro"
  key_name = "test-a2"

  tags = {
    Name = "Client"
  }
}