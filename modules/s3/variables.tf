variable "aws_region_main" {
  type = string
}

variable "aws_region_backup" {
  type = string
}

variable "force_destroy" {
  type = string
}



variable "tags" {
  type        = map(string)
  description = "tags"
  default = {
    "owner"       = "Samuel"
    "teams"       = "devops"
    "environment" = "dev"
    "project"     = "anaconda"
    "create_by"   = "Samuel"
  }
}