output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}

output "frontend_private_ip" {
  value = aws_instance.frontend.private_ip
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}

output "database_private_ip" {
  value = aws_instance.database.private_ip
}