# Creates the EIP
resource "aws_eip" "this" {
  vpc = true
  tags = merge(
    local.eip_tags,
    {
      Name = "eip-${var.app_name}"
    }
  )
}

# Associate EIP to instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2_instance.id
  allocation_id = aws_eip.this.id
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  name = "bastion"

  ami                    = var.ami_id
  instance_type          = var.ec2_instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_ids_public[0]
  vpc_security_group_ids = [aws_security_group.secgroup.id]
  iam_instance_profile   = aws_iam_instance_profile.instance-aws-app.id
  user_data              = file("../files/add_ansible_access.sh")
  enable_volume_tags     = false

  root_block_device = [
    {
      volume_size = var.rbd_volume_size
      volume_type = var.rbd_volume_type
      tags = merge(
        local.rbd_tags,
        {
          Name = "${var.app_name}"
        }
      )
    }
  ]

  tags = merge(
    local.terraform_tags,
    {
      Name                  = "${var.app_name}"
      "company-name:ansible-group" = var.app_name
    }
  )
}
