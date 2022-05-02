# AWS ECS Cluster with multiple instance type

This module provision the whole ECS cluster backed by multiple instance type
through multiple capacity provider. The resources involve are:

- ECS Cluster
- IAM Instance Profile
- Multiple Launch Configuration
- Multiple AutoScaling Group
- Multiple ECS Capacity Provider

# Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_ecs_capacity_provider.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_iam_instance_profile.ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_launch_template.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_ami.ecs_optimized](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_role.ecs-instance-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |
| [aws_security_group.ecs-launch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The name for ECS cluster. | `string` | n/a | yes |
| <a name="input_ecs_security_group_id"></a> [ecs\_security\_group\_id](#input\_ecs\_security\_group\_id) | The ID of the security group use for ECS instances. | `string` | n/a | yes |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | To enable container insights which will cost you more money in AWS CloudWatch | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for the ECS cluster. | `string` | `"stag"` | no |
| <a name="input_instance_configuration"></a> [instance\_configuration](#input\_instance\_configuration) | n/a | <pre>map(object({<br>    instance_type             = string<br>    desired_instance_capacity = number<br>    min_instance_capacity     = number<br>    max_instance_capacity     = number<br>    protect_from_scale_in     = bool<br>  }))</pre> | <pre>{<br>  "t3-micro": {<br>    "desired_instance_capacity": 1,<br>    "instance_type": "t2.micro",<br>    "max_instance_capacity": 2,<br>    "min_instance_capacity": 1,<br>    "protect_from_scale_in": true<br>  }<br>}</pre> | no |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | The role profile name for ECS instances. | `string` | n/a | yes |
| <a name="input_pem_key_name"></a> [pem\_key\_name](#input\_pem\_key\_name) | The name of the PEM key for your ECS cluster instance | `string` | `"pem-key-infra"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to create ECS cluster in. | `string` | `"ap-southeast-1"` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | The tags for your resource | `map(any)` | n/a | yes |
| <a name="input_team"></a> [team](#input\_team) | The team for ECS cluster | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to create `ECS cluster in.` | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --
