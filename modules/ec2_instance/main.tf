resource "aws_instance" "samka1" {
  count                   = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  security_groups        = var.security_groups
  disable_api_termination = var.enable_termination_protection

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdh"
    volume_size           = var.ebs_volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }

  monitoring              = true

  user_data               = var.user_data

  tags = var.tags
}
