resource "aws_instance" "nginx" {
  subnet_id     = aws_subnet.id
  security_groups = [aws_security_group.nginx_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum instal nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<html><h1>Hello, World!</h1></html>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "nginx-server-guardian-life"
  }
}
