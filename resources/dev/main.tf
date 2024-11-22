locals {
  aws_region                  = "us-east-1"
  instance_type               = "t2.micro"
  key_name                    = "s7-key"
  availability_zone           = "us-east-1a"
  user_data                   = <<-EOT
#!/bin/bash

# https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
# Please install the Long Term Support release

function jenkins_installation {
    sudo apt update
    ## Set vim as default text editor
    sudo update-alternatives --set editor /usr/bin/vim.basic
    sudo update-alternatives --set vi /usr/bin/vim.basic
    sudo apt install fontconfig openjdk-17-jre -y
    java -version

    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins -y

    sudo systemctl start jenkins
    sudo systemctl enable jenkins

    INSTANCE_PUBLIC_IP=$(curl -s ifconfig.me)
    ADMIN_KEY=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
    JENKINS_URL="http://$INSTANCE_PUBLIC_IP:8080"
    echo "Jenkins is installed and running. You can access it at $JENKINS_URL"
    echo "This is the initialAdminPassword: $ADMIN_KEY"
}
jenkins_installation
sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh
  EOT
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
  tags                        = local.tags
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "private_ip" {
  value = module.ec2_instance.private_ip
}
