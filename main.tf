terraform {
  required_providers {
    # kubernetes = {
    #   source = "hashicorp/kubernetes"
    # }
    helm = {
      source  = "hashicorp/helm"
      version = "2.3.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_context = "minikube"
    config_path    = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name = "nginx-ingress-controller"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
