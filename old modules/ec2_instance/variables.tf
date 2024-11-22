variable "instance_count" {
  type    = number
  default = 1
}

variable "ami_id" {
  type    = string
  default = "ami-0ddc798b3f1a5117e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "s7-key"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0fa1220c77e6b2714"
}

variable "security_groups" {
  type    = list(string)
  default = ["sg-0fd30a6787b68a568"]
}

variable "enable_termination_protection" {
  type    = bool
  default = false
}

variable "root_volume_size" {
  type    = number
  default = 10
}

variable "ebs_volume_size" {
  description = "The additional EBS volume size in GiB"
  type        = number
  default     = 20
}

variable "user_data" {
  type    = string
  default = <<-EOF
                #!/bin/bash
                echo "Hello, World!" > /var/www/html/index.html
                EOF
}

variable "tags" {
  type = map(any)
  default = {
    "Name"      = "samka-ec2-module"
    "Env"       = "dev"
    "Project"   = "anaconda"
    "Create_by" = "samka"
    "Teams"     = "devops"

  }
}

variable "root-volume-type" {
  type    = string
  default = "gp2"
}

variable "root-termination" {
  type    = bool
  default = true
}

variable "public-ip" {
  type    = bool
  default = true
}

variable "ebs-device-name" {
  type    = string
  default = "/dev/sdh"
}

variable "ebs-volume-type" {
  type    = string
  default = "gp2"
}

variable "ebs-termination" {
  type    = bool
  default = true
}

variable "monitoring" {
  type    = bool
  default = true
}