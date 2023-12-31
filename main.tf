
provider "aws" {
  region = "us-east-1" # Change this to your desired region
}

resource "aws_instance" "web_server" {
  ami           = "ami-079db87dc4c10ac91" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name="clarusway-kp"
  tags = {
    Name = "Web Server of Bookstore"
  }

   user_data = <<-EOF
              #!/bin/bash
              git clone https://github.com/taydinadnan/Dockerization-of-Bookstore-Web-API-Python-Flask-with-MySQL.git /home/ec2-user/bookstore
              cd /home/ec2-user/bookstore
              docker-compose up -d
              EOF
}

output "bookstore_api_url" {
  value = aws_instance.web_server.public_ip
}





