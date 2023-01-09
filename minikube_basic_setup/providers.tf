// Providers are the third-party (downloaded) Dependencies for a set of Terraform code
//
// Version Constraints:
// - `=`: Requires an exact version match (this is equivalent to not using a Version Constraint string)
// - `!=`: Only this exact version is _not_ acceptable (anything greater or lower is allowed)
// - `>=`: Latest version that is equal to the current version or has a greater version number (in any number)
// - `>`: Latest version that has a greater version number (in any number)
// - `<`: Latest version that has a lower version number (in any number)
// - `<=`: Latest version that is equal to the current version or has a lower version number (in any number)
// - `~>`: Only the rightmost version number can increase
//
// References:
// - https://developer.hashicorp.com/terraform/language/providers/requirements
// - https://developer.hashicorp.com/terraform/language/expressions/version-constraints

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1" // https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs
    }
  }
}

provider "kubernetes" {
  // References:
  // - https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs

  config_path    = "./minikube.config"
  config_context = "minikube"
}
