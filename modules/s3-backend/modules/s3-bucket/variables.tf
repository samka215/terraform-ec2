
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