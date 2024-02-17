

# swarm
resource "aws_lb_listener_rule" "swarm" {
  listener_arn = aws_lb_listener.https_listener.id
  priority = "1"

  action {
    target_group_arn = aws_lb_target_group.swarm.id
    type  = "forward"
    order = "1"
  }

  condition {
    host_header {
      values = ["*"]
    }
  }
}
