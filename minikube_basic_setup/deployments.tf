// Kubernetes (k8s) Deployments
//
// References:
// - https://github.com/chefgs/terraform_repo/tree/main/kubernetes
// - https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment

resource "kubernetes_deployment" "webserver" {
  metadata {
    name = "local-webserver"
    labels = {
      purpose   = "demo"
      developer = "tommy"
    }
    namespace = kubernetes_namespace.demo.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        purpose = "demo"
      }
    }

    template {
      metadata {
        labels = {
          purpose = "demo"
        }
      }

      spec {
        container {
          image = "nginx:1.23.3" // https://hub.docker.com/layers/library/nginx/1.23.3/images/sha256-9a821cadb1b13cb782ec66445325045b2213459008a41c72d8d87cde94b33c8c?context=explore
          name  = "demo"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }

            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
