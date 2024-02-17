# environments/production/servers/lb_listener.tf

################################################################################
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.main.id
  certificate_arn   = aws_acm_certificate.main.id
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

  default_action {
    order            = "1"
    target_group_arn = aws_lb_target_group.swarm.id
    type             = "forward"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    order = "1"
    type = "redirect"

    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }
  }
}
