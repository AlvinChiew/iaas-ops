locals {
  cluster_name = "${var.environment}-${var.ecs_cluster_name}-cluster"
}

resource "aws_iam_instance_profile" "ecs" {
  name = "${var.environment}-${var.ecs_cluster_name}-ECSInstanceProfile"
  role = data.aws_iam_role.ecs-instance-role.name
}

resource "aws_launch_template" "app" {
  for_each = var.instance_configuration

  name_prefix   = local.cluster_name
  image_id      = data.aws_ami.ecs_optimized.id
  instance_type = each.value.instance_type

  user_data              = base64encode("#!/bin/bash\necho ECS_CLUSTER='${local.cluster_name}\nECS_ENABLE_AWSLOGS_EXECUTIONROLE_OVERRIDE=true' > /etc/ecs/ecs.config")
  key_name               = var.pem_key_name
  vpc_security_group_ids = [data.aws_security_group.ecs-launch.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs.name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  for_each = var.instance_configuration

  name                = "${each.key}-${local.cluster_name}"
  vpc_zone_identifier = data.aws_subnets.private.ids

  desired_capacity = each.value.desired_instance_capacity
  min_size         = each.value.min_instance_capacity
  max_size         = each.value.max_instance_capacity

  protect_from_scale_in = each.value.protect_from_scale_in

  launch_template {
    id      = aws_launch_template.app[each.key].id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = ""
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "[${var.environment}] ${var.ecs_cluster_name}-cluster-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Cluster"
    value               = var.ecs_cluster_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Team"
    value               = var.team
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [desired_capacity]
  }
}

resource "aws_ecs_capacity_provider" "default" {
  for_each = var.instance_configuration
  name     = "${each.key}-${local.cluster_name}"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.app[each.key].arn
    managed_termination_protection = each.value.protect_from_scale_in ? "ENABLED" : "DISABLED"

    managed_scaling {
      maximum_scaling_step_size = 4
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 100
    }
  }
}

resource "aws_ecs_cluster" "app" {
  name = local.cluster_name

  setting {
    name  = "containerInsights"
    value = var.enable_container_insights ? "enabled" : "disabled"
  }

  tags = var.resource_tags
}

resource "aws_ecs_cluster_capacity_providers" "app" {
  cluster_name = aws_ecs_cluster.app.name
  capacity_providers = [
    for index, ic in var.instance_configuration :
    aws_ecs_capacity_provider.default[index].name
  ]
}
