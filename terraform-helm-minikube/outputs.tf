output "helm_release_status" {
  description = "Status of the Helm release"
  value       = module.helm_release.status
}

