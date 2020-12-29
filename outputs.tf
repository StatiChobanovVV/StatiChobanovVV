output "cognito" {
  value       = data.terraform_remote_state.state.outputs.cognito
  description = "Cognito user pool endpoint"
}

output "api_gateway" {
  value       = data.terraform_remote_state.state.outputs.api_gateway
  description = "Authorizer configuration"
}

output "vpc" {
  value = data.terraform_remote_state.state.outputs.vpc
  description = "API Stage resources"
}