// Kubernetes (k8s) Deployments
//
// References:
// - https://github.com/chefgs/terraform_repo/tree/main/kubernetes
// - https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "demo"
  }
}
