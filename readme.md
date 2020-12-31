# A data module for accessing the resources created with tf_base_infra

## 1. Usage:

Checkout this repo as a submodule and reference if from the check-out folder:

```
module "state" {
  source = "./modules/state"
  region      = "eu-west-1"
  environment = "dev" #or stage or release or ...
}
```

Or reference the module directly from the repository:

```
module "state" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/tf_base_data"
  region      = "eu-west-1"
  environment = "dev"
}
```

then in your deployment script use the data from the module:

- Example: Create new rout on the API Gateway and set-up the existing cognito authorizer
```
resource "aws_apigatewayv2_route" "example" {
  route_key = "GET /foobar"
  api_id    = module.state.api_gateway.api.id
  authorization_type = "JWT"
  authorizer_id      = module.state.api_gateway.authorizer_id
}
```

## 2. State properties available through the module:

- api_gateway - API Gateway related resources
  - api - the API Gateway resource instance
    - api_endpoint - the API Gateway endpoint
    - arn
    - id
    - name - "iuk_api"
    - protocol_type - "HTTP"
  - authorizer_id - the identifier of pre-defined cognito authorizer
  - stages - there are 3 stages defined for this API Gateway:
    - dev - API Gateway stage object aws_apigatewayv2_stage https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage
    - release
    - staging
- cognito - the cognito module outputs
  - client_ids - an array of defined cognito client IDs
  - endpoint - endpoint for accessing cognito API
- vpc - the Virtual Private Cloud definition for the infrastructure
  - Bastion-Host-public-ip - IP of the bastion host for accessing private VPC resources
  - iuk_vpc - the VPC resource instance
    - arn
    - cidr_block = "10.1.0.0/16"
    - id
- sqs
  - inqueue - Queue used to transfer messages from VVIT to IUK
    - arn - AWS resource ARN (Amazon Resource Name)
     - id - The queue access URL, it is in the form https://sqs.< region >.amazonaws.com/< account No >/< queue name >
    - name - The queue name
  - outqueue - Queue used to transfer messages from IUK to VVIT
    - arn
    - id
     - name
## 3. Mainteiners
    Alexander Niolov  alexander.nikolov@vertigoventures.com
    Shener Halim      shener.halim@vertigoventures.com

