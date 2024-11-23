variable "aws_region" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "key_name" {
  type        = string
}

variable "availability_zone" {
  type        = string
}

variable "user_data" {
  type        = string
}

variable "tenancy" {
  type        = string
}

variable "associate_public_ip_address" {
  type        = bool
}

variable "volume_type" {
  type        = string
}

variable "volume_size" {
  type        = number
}

variable "iops" {
  type        = number
}

variable "delete_on_termination" {
  type        = bool
}

variable "encrypted" {
  type        = bool
}

variable "tags" {
  type        = map(string)
  default = {
    "owner"       = "Samuel"
    "teams"       = "Devops"
    "environment" = "dev"
    "Project"     = "Anaconda"
    "create_by"   = "Samuel"
  }
}