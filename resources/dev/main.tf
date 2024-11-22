locals {
  aws_region                  = "us-east-1"
  instance_type               = "t2.micro"
  key_name                    = "s7-key"
  availability_zone           = "us-east-1a"
  user_data                   = file("${path.module}/script/install_jenkins.sh")
  tenancy                     = "default"
  associate_public_ip_address = true
  volume_type                 = "gp3"
  volume_size                 = 8
  iops                        = 100
  delete_on_termination       = true
  encrypted                   = false
  tags = {
    "owner"       = "Samuel"
    "teams"       = "Devops"
    "environment" = "dev"
    "Project"     = "Anaconda"
    "create_by"   = "Samuel"
  }
}



module "ec2_instance" {
  source                      = "../../modules/ec2"
  aws_region                  = local.aws_region
  instance_type               = local.instance_type
  key_name                    = local.key_name
  availability_zone           = local.availability_zone
  user_data                   = local.user_data
  tenancy                     = local.tenancy
  associate_public_ip_address = local.associate_public_ip_address
  volume_type                 = local.volume_type
  volume_size                 = local.volume_size
  iops                        = local.iops
  delete_on_termination       = local.delete_on_termination
  encrypted                   = local.encrypted
  tags = local.tags

}
