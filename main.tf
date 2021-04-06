locals {
  env_suffix = var.environment!="production" ? "-${var.environment}":""
}

data "terraform_remote_state" "state" {
  backend = "s3"
  config = {
    encrypt = "true"
    bucket = "base-iuk-terraform-bucket${local.env_suffix}"
    key  = "dev-base-infra/shared.tfstate"
    region = var.region
  }
}
