output "bastion_id" {
  value = module.ec2_instance.id
}

output "bastion_private_ip" {
  value = module.ec2_instance.private_ip
}

output "bastion_public_ip" {
  value = module.ec2_instance.public_ip
}
