

# the swarm manager is the one to recieve requests and distribute them.
resource "aws_lb_target_group_attachment" "swarm_manager" {
  target_group_arn = aws_lb_target_group.swarm.arn
  target_id        = aws_instance.swarm_manager.id
}
