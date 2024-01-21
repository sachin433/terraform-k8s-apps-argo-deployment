environment="dev"
destination_cluster="https://<URL-FOR-CLUSTER-IN-ARGO>"

infra_helm_apps = [
    {
        service_name  = "kong"
        namespace = "kong"
        repo_url = "git@github.com:sachin433/terraform-k8s-apps-argo-deployment.git"
        helm_chart_path = "./helm/kong"
        environment_file_name = "dev"
        release_name = "dev"
        target_revision = "master"
    }
]
