output "namespace" {
  value = kubernetes_namespace.demo.metadata[0].name
}

output "deployment" {
  value = kubernetes_deployment.webserver.metadata[0].name
}
