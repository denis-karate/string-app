variable "release_name" {
  description = "The name of the Helm release"
  type        = string
}

variable "chart_path" {
  description = "The path to the Helm chart"
  type        = string
}

variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
}

variable "values_file" {
  description = "Path to the values file for the Helm release"
  type        = string
}

