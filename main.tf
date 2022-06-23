resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.availability_zones
  security_groups    = [aws_security_group.ssh_from_office.id]

  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }
  instances = var.instance_id

}

resource "aws_security_group" "ssh_from_office" {
  name        = "ssh_from_office"
  description = "Allow ssh from office"
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

