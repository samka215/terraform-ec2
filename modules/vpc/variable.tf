
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
}

variable "tags" {
  type        = map(string)
  default = {
    "owner"       = "Samuel"
    "teams"       = "Devops"
    "environment" = "dev"
    "project"     = "Anaconda"
    "create_by"   = "Samuel"
  }
}

variable "subnet_cidr_prefix" {
  default     = "10.0"
}

variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
}
