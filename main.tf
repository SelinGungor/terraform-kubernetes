provider "google" {
project = var.project
region = var.region
zone = var.zone
}

module "kubernetes_cluster" {
    source = "./kubernetes"
}