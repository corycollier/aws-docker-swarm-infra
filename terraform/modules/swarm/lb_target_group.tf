# environments/production/servers/lb_target_group.tf

resource "aws_lb_target_group" "swarm" {
  vpc_id           = var.vpc_id
  name             = "${var.swarm_name}-${var.swarm_environment}-swarm"
  target_type      = "instance"
  ip_address_type  = "ipv4"
  port             = "80"
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  depends_on       = [aws_lb.main]

  health_check {
    enabled             = "true"
    healthy_threshold   = "2"
    interval            = "30"
    matcher             = "200-499"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "5"
  }
}
