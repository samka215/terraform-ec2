
output "instance_id" {
  value = [for instance in aws_instance.samka1 : instance.id]
}

output "public_ip" {
  value = [for instance in aws_instance.samka1 : instance.public_ip]
}

output "private_ip" {
  value = [for instance in aws_instance.samka1 : instance.private_ip]
}

output "availability_zone" {
  value = [for instance in aws_instance.samka1 : instance.availability_zone]
}

