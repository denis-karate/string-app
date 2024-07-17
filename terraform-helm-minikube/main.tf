provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "my_app" {
  name       = "my-app"
  chart      = "../helm/my-app"
  namespace  = "default"
  
  values = [
    file("../helm/my-app/values.yaml")
  ]
}

