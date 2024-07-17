provider "kubernetes" {
  config_path = var.kube_config_path
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config_path
  }
}

module "helm_release" {
  source       = "./modules/helm_release"
  release_name = var.release_name
  chart_path   = var.chart_path
  namespace    = var.namespace
  values_file  = var.values_file
}

