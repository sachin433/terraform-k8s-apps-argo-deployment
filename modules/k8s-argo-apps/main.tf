terraform {
  required_providers {
    argocd = {
      source = "oboukili/argocd"
      version = "5.6.0"
    }
  }
}

resource "argocd_application" "infra_helm_app" {
  metadata {
    name   = "${var.environment}-${var.service_name}"
    labels = {
      env = var.environment
      service = var.service_name
      type = "microservice"
    }
  }

  spec {
    project = var.environment
    source {
      repo_url        = var.repo_url
      path            = var.helm_chart_path
      target_revision = var.target_revision
      helm  {
        value_files = ["environments/${var.environment_file_name}.yaml"]
        release_name = var.release_name
        }
      }
          
    destination {
      server    = var.destination_cluster
      namespace = var.namespace
    }

    sync_policy {
      automated  {
        prune       = false
        self_heal   = false
        allow_empty = false
      }
    }
  }

  lifecycle {
    ignore_changes = [
      spec[0]
    ]
  }
}

