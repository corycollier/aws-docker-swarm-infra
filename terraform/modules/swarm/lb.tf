# environments/production/servers/alb.tf

resource "aws_lb" "main" {
  name                             = "${var.swarm_name}-${var.swarm_environment}-lb"
  desync_mitigation_mode           = "defensive"
  drop_invalid_header_fields       = "false"
  enable_cross_zone_load_balancing = "true"
  enable_http2                     = "true"
  enable_waf_fail_open             = "false"
  enable_xff_client_port           = "false"
  idle_timeout                     = "3600"
  internal                         = "false"
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  preserve_host_header             = "true"
  xff_header_processing_mode       = "append"

  subnets = [
    var.subnet_1_id,
    var.subnet_2_id
  ]

  security_groups = [
    aws_security_group.internal.id,
    aws_security_group.web.id
  ]
}
