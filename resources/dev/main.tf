module "ec2_instance" {
  source                      = "../../modules/ec2"
  aws_region                  = "us-east-1"
  instance_type               = "t2.micro"
  key_name                    = "s7-key"
  availability_zone           = "us-east-1a"
  user_data                   = <<EOF
    #!/bin/bash
    # Your user data script here
    EOF
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
