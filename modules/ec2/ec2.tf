resource "aws_instance" "ec2" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone
  security_groups   = [aws_security_group.samka-sg.name]
  user_data                   = var.user_data
  tenancy                     = var.tenancy
  associate_public_ip_address = var.associate_public_ip_address
  
  tags = merge(var.tags, {
    Name = "${var.tags["Project"]}-ec2"
    }
  )

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    iops                  = var.iops
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
  }
}
