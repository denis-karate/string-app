resource "helm_release" "my_app" {
  name       = var.release_name
  chart      = var.chart_path
  namespace  = var.namespace
  
  values = [
    file(var.values_file)
  ]
}

