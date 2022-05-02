data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    Network = "Private"
  }
}

data "aws_security_group" "ecs-launch" {
  id = var.ecs_security_group_id
}

data "aws_iam_role" "ecs-instance-role" {
  name = "ECSInstanceRole"
}

data "aws_ami" "ecs_optimized" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-*-x86_64-gp2"] # ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
    # get name via cli: aws ec2 describe-images --image-ids <image-id>
  }
}
