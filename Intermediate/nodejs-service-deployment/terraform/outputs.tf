output "instance_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "instance_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.main.public_dns
}

resource "local_file" "ansible_inventory" {
  content  = <<-INI
    [web]
    ec2-instance ansible_host=${aws_instance.main.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/${var.key_name}
  INI
  filename = "${path.module}/../ansible/inventory.ini"
}