output "status" {
  description = "Status of the Helm release"
  value       = helm_release.my_app.status
}

