resource "aws_instance" "tomcat_server" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.main.id
  security_groups             = [aws_security_group.allow_ssh.name]
  associate_public_ip_address = true

    user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y java-openjdk11
              wget <tomcat-link-from apache whatever this is>
              unzip <linnk from above>
               EOF

    tags = {
    Name = "TomcatServer"
  }
}
