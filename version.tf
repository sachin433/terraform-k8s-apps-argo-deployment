terraform {
  required_providers {
    argocd = {
      source = "oboukili/argocd"
      version = "5.6.0"
    }
  }

  backend "s3" {
    bucket  = "argocd-terraform-tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

provider "argocd" {
  server_addr = "argocd-prod.<COMPANY>.tech"

}