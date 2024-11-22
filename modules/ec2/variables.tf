variable "aws_region" {
  type        = string
  description = "Name of the SSH key pair to associate with the instance"
}


variable "instance_type" {
  type        = string
  description = "Name of the SSH key pair to associate with the instance"
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair to associate with the instance"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone for the instance"
}


variable "user_data" {
  type        = string
  description = "User data script to provision the instance"
}

variable "tenancy" {
  type        = string
  description = "Tenancy of the instance (default | dedicated)"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance"
}

variable "volume_type" {
  type        = string
  description = "Volume type (standard | gp2 | gp3 | io1 | sc1 | st1)"
}

variable "volume_size" {
  type        = number
  description = "Size of the root volume in GiB"
}

variable "iops" {
  type        = number
  description = "IOPS for Provisioned IOPS SSD volumes"
}

variable "delete_on_termination" {
  type        = bool
  description = "Delete the root volume on instance termination"
}

variable "encrypted" {
  type        = bool
  description = "Encrypt the root volume"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    "owner"       = "Samuel"
    "teams"       = "Devops"
    "environment" = "dev"
    "Project"     = "Anaconda"
    "create_by"   = "Samuel"
  }
}