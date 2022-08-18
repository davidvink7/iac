
module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.5.0"
  # insert the 39 required variables here

  name = "${local.full_app_name}-asg"

  min_size                  = 2
  max_size                  = 5
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier = [
    data.terraform_remote_state.vpc.outputs.aws_subnet_instance-1a-asg_id,
    data.terraform_remote_state.vpc.outputs.aws_subnet_instance-1b-asg_id,
    data.terraform_remote_state.vpc.outputs.aws_subnet_instance-1c-asg_id
  ]

  target_group_arns = [
    module.alb.target_group_arns[0]
  ]

  # initial_lifecycle_hooks = [
  #   {
  #     name                  = var.initial_lifecycle_hook_name
  #     default_result        = "CONTINUE"
  #     heartbeat_timeout     = 60
  #     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
  #     notification_metadata = jsonencode({ "hello" = "world" })
  #   },
  #   {
  #     name                  = "ExampleTerminationLifeCycleHook"
  #     default_result        = "CONTINUE"
  #     heartbeat_timeout     = 180
  #     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
  #     notification_metadata = jsonencode({ "goodbye" = "world" })
  #   }
  # ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay       = 600
      checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 60
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  termination_policies = [
    "NewestInstance",
  ]

  # Launch template
  launch_template_name        = "${local.full_app_name}-lt"
  launch_template_description = "Launch template ${local.full_app_name}-lt"
  update_default_version      = true
  iam_instance_profile_arn    = data.terraform_remote_state.iam.outputs.aws_iam_instance_profile_instance-aws-app-asg_arn

  image_id          = var.ami_id
  instance_type     = var.ec2_instance_type
  ebs_optimized     = var.ebs_optimized
  enable_monitoring = var.enable_monitoring
  key_name          = var.ec2_key_name
  user_data         = base64encode(templatefile("files/add_ansible_access.tftpl", { environment = var.environment }))

  block_device_mappings = [
    {
      # Root volume
      device_name = var.rbd_device_name
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = var.rbd_encrypted
        volume_size           = var.rbd_volume_size
        volume_type           = var.rbd_volume_type
      }
    },
    {
      device_name = var.ebs_device_name
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = var.ebs_encrypted
        volume_size           = var.ebs_volume_size
        volume_type           = var.ebs_volume_type
      }
    }
  ]

  # capacity_reservation_specification = {
  #   capacity_reservation_preference = "open"
  # }

  # cpu_options = {
  #   core_count       = 1
  #   threads_per_core = 1
  # }

  # credit_specification = {
  #   cpu_credits = "standard"
  # }

  # instance_market_options = {
  #   market_type = "spot"
  #   spot_options = {
  #     block_duration_minutes = 60
  #   }
  # }

  # metadata_options = {
  #   http_endpoint               = "enabled"
  #   http_tokens                 = "required"
  #   http_put_response_hop_limit = 32
  # }

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [data.terraform_remote_state.vpc.outputs.aws_security_group_sg-asg_id]
    }
  ]

  # placement = {
  #   availability_zone = "us-west-1b"
  # }

  tag_specifications = [
    {
      resource_type = "instance"
      tags          = { WhatAmI = "Instance" }
    },
    {
      resource_type = "volume"
      tags          = { WhatAmI = "Volume" }
    }
  ]

  tags = var.prod ? merge(
    local.terraform_tags, local.prod_tags,
    {
      Name = "${local.full_app_name}-asg"
    },
    ) : merge(
    local.terraform_tags,
    {
      Name = "${local.full_app_name}-asg"
    },
  )

}
