#----------------------------------------------------------------------------
#                      Keypair creation
#----------------------------------------------------------------------------

resource "aws_key_pair" "frontend" {
  key_name   = "${var.project_name}-${var.project_env}"
  public_key = file("mykey.pub")
  tags = {
    Name = "${var.project_name}-${var.project_env}"
  }
}
#----------------------------------------------------------------------------
#                      webserver SecurityGroup
#----------------------------------------------------------------------------
resource "aws_security_group" "webserver_access" {
  name        = "${var.project_name}-${var.project_env}-webserver-access"
  description = "${var.project_name}-${var.project_env}-webserver-access"
  ingress {
    description      = "http traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "https traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name    = "${var.project_name}-${var.project_env}-weberver-access"
    project = var.project_name
    env     = var.project_env
    owner   = var.project_owner
  }
}
#----------------------------------------------------------------------------
#                      Remote Access SecurityGroup
#----------------------------------------------------------------------------
resource "aws_security_group" "remote_access" {
  name        = "${var.project_name}-${var.project_env}-remote-access"
  description = "${var.project_name}-${var.project_env}-remote-access"
  ingress {
    description      = "ssh traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name    = "${var.project_name}-${var.project_env}-remote-access"
    project = var.project_name
    env     = var.project_env
    owner   = var.project_owner
  }
}
