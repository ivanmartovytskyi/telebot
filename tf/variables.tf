variable "GOOGLE_REGION" {
  type = string
  default = "us-central1-c"
  description = "Google Cloud Platform region for GKE cluster deployment"
}

variable "GOOGLE_PROJECT" {
  type = string
  default = "devops-038921093"
  description = "Google Cloud Platform project ID"
}

variable "GKE_NUM_NODES" {
  type = string
  default = "1"
  description = "Number of nodes in the GKE cluster"
}

variable "GITHUB_OWNER" {
  type = string
  description = "Github login"
}

variable "GITHUB_TOKEN" {
  type = string
  description = "Github personal token with repo create/delete permissions"
}

variable "FLUX_GITHUB_REPO" {
  type = string
  default = "flux-gitops"
  description = "Flux repo name"
}

variable "algorithm" {
  type = string
  default = "RSA"
  description = "Tls module algorithm"
}
