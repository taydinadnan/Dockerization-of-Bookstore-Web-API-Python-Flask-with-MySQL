provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "selected" {
  default = true
}

resource "aws_security_group" "alb-sg" {
  name   = "ALBSecurityGroup"
  vpc_id = data.aws_vpc.selected.id
  tags = {
    Name = "TF_ALBSecurityGroup"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  
  vpc_security_group_ids = [aws_security_group.alb-sg.id]
  key_name="clarusway-kp"
  tags = {
    Name = "Web Server of Bookstore"
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    systemctl start docker
    systemctl enable docker
    usermod -a -G docker ec2-user
    curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    mkdir -p /home/ec2-user/bookstore-api
    git clone https://github.com/taydinadnan/Dockerization-of-Bookstore-Web-API-Python-Flask-with-MySQL.git /home/ec2-user/bookstore
    cd /home/ec2-user/bookstore
    docker build -t "turgay/bookstore:latest" .
    docker-compose up -d
  EOF
}

output "bookstore_api_url" {
  value = aws_instance.web_server.public_ip
}
