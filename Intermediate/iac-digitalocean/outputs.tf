output "instance_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "instance_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.main.public_dns
}