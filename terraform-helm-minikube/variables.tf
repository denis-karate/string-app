variable "kube_config_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = "default"
}

variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "flask-app"
}

variable "chart_path" {
  description = "The path to the Helm chart"
  type        = string
  default     = "../helm/my-app"
}

variable "values_file" {
  description = "Path to the values file for the Helm release"
  type        = string
  default     = "../helm/my-app/values.yaml"
}

