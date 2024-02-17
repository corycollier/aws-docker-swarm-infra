resource "aws_iam_role" "ec2_instance_role" {
  name                 = "${var.swarm_name}-ec2-instance-role"
  description          = "Allows EC2 instances to call AWS services on your behalf."
  max_session_duration = "3600"
  path                 = "/"
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = [
    "arn:aws:iam::${var.aws_account_id}:policy/${var.swarm_name}-ec2-read-policy",
    "arn:aws:iam::${var.aws_account_id}:policy/${var.swarm_name}-ecr-readonly",
  ]
}
