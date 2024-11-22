
variable "tags" {
  type        = map(string)
  description = "tags"
  default = {
    "owner"       = "Samuel"
    "teams"       = "Devops"
    "environment" = "dev"
    "project"     = "Anaconda"
    "create_by"   = "Samuel"
  }
}