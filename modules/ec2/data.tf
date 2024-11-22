data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


# data "aws_security_group" "samka_sg_info" {
#   filter {
#     name   = "tag:Name"
#     values = ["Anaconda-sg"]
#   }
# }