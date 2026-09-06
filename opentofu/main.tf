terraform {
  required_version = ">= 1.6.0, < 2.0.0"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path    = pathexpand(var.kubeconfig_path)
    config_context = var.kube_context
  }
}

resource "helm_release" "operator" {
  count            = var.install_operator ? 1 : 0
  name             = "mysql-operator"
  namespace        = var.namespace
  create_namespace = false
  chart            = "${path.module}/../operator"
  wait             = true
  timeout          = 900
}

resource "helm_release" "this" {
  depends_on       = [helm_release.operator]
  name             = "mysql"
  namespace        = var.namespace
  create_namespace = false
  chart            = "${path.module}/../charts/mysql"
  atomic           = true
  cleanup_on_fail  = true
  wait             = true
  timeout          = 900
  max_history      = 5
  values           = concat([file("${path.module}/../charts/mysql/values-production.yaml")], [for path in var.values_files : file(pathexpand(path))])
}
