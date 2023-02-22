resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.availability_zones
  security_groups    = [aws_security_group.ssh_from_office.id]
  cross_zone_load_balancing = var.cross_zone_load_balancing
  desync_mitigation_mode = var.desync_mitigation_mode
  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
    ssl_certificate_id = var.ssl_certificate_id
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }
  instances = var.instance_id
  connection_draining = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  access_logs {
    bucket = var.access_logs_bucket
    enabled = var.access_logs_enabled
    bucket_prefix = var.access_logs_bucket_prefix
  }
}

resource "aws_security_group" "ssh_from_office" {
  name        = "ssh_from_office"
  description = "Allow ssh from office"
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

