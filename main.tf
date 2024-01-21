module "k8s-argo-apps" {

  # for_each              = var.infra_helm_apps
  for_each              = {for app in var.infra_helm_apps:  app.service_name => app}
  source                = "./modules/k8s-argo-apps"

  service_name          = each.key
  environment           = var.environment
  destination_cluster   = var.destination_cluster
  namespace             = each.value.namespace
  repo_url              = each.value.repo_url
  helm_chart_path       = each.value.helm_chart_path
  environment_file_name = each.value.environment_file_name
  release_name          = each.value.release_name
  target_revision       = each.value.target_revision
}