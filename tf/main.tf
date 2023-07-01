module "github-repository" {
  source                    = "./modules/tf-github-repository"
  github_owner              = var.GITHUB_OWNER
  github_token              = var.GITHUB_TOKEN
  repository_name           = var.FLUX_GITHUB_REPO
  public_key_openssh        = module.tls_private_key.public_key_openssh
  public_key_openssh_title  = "flux_key"
}

module "gke_cluster" {
  source          = "./modules/tf-google-gke-cluster"
  GOOGLE_REGION   = var.GOOGLE_REGION
  GOOGLE_PROJECT  = var.GOOGLE_PROJECT
  GKE_NUM_NODES   = 1
}

module "flux_bootstrap" {
  source          = "./modules/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  config_path       = module.gke_cluster.kubeconfig
  github_token      = var.GITHUB_TOKEN
}

module "tls_private_key" {
  source          = "./modules/tf-hashicorp-tls-keys"
  algorithm       = var.algorithm
}
