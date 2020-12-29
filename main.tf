data "terraform_remote_state" "state" {
  backend = "s3"
  config = {
    encrypt = "true"
    bucket = "base-iuk-terraform-bucket"
    key  = "${var.environment}-base-infra/shared.tfstate"
    region = var.region
  }
}
