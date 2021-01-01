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

output "sqs" {
  value       = data.terraform_remote_state.state.outputs.sqs
  description = "Queues for exchanging messages between VVIT and IUK"
}

output "db" {
  value = data.terraform_remote_state.state.outputs.db
  description = "The outputs from the DB module"
}