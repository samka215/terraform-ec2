resource "aws_instance" "samka1" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.public-ip
  security_groups             = var.security_groups
  disable_api_termination     = var.enable_termination_protection

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root-volume-type
    delete_on_termination = var.root-termination
  }

  ebs_block_device {
    device_name           = var.ebs-device-name
    volume_size           = var.ebs_volume_size
    volume_type           = var.ebs-volume-type
    delete_on_termination = var.ebs-termination
  }

  monitoring = var.monitoring

  user_data = var.user_data

  tags = var.tags
}
