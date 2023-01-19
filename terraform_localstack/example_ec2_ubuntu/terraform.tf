// Providers are the third-party (downloaded) Dependencies for a set of Terraform code
//
// Version Constraints:
// - `=`: Requires an exact version match (this is equivalent to not using a Version Constraint string)
// - `!=`: Only this exact version is _not_ acceptable (anything greater or lower is allowed)
// - `>=`: Latest version that is equal to the current version or has a greater version number (in any number)
// - `>`: Latest version that has a greater version number (in any number)
// - `<`: Latest version that has a lower version number (in any number)
// - `<=`: Latest version that is equal to the current version or has a lower version number (in any number)
// - `~>`: Only the rightmost version number can increase
//
// References:
// - https://developer.hashicorp.com/terraform/language/providers/requirements
// - https://developer.hashicorp.com/terraform/language/expressions/version-constraints
// - https://stackoverflow.com/questions/61084050/how-to-create-ec2-instance-on-localstack-with-terraform

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0" // https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # profile                     = "localstack"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  // LocalStack Mock AWS Environment(s)
  // `docker run -it -p 4500-4600:4500-4600 -p 8080:8080 --expose 4572 localstack/localstack:1.3.1`
  endpoints {
    apigateway     = "http://localhost:4567"
    cloudformation = "http://localhost:4581"
    cloudwatch     = "http://localhost:4582"
    dynamodb       = "http://localhost:4569"
    es             = "http://localhost:4578"
    firehose       = "http://localhost:4573"
    iam            = "http://localhost:4593"
    kinesis        = "http://localhost:4568"
    lambda         = "http://localhost:4574"
    route53        = "http://localhost:4580"
    redshift       = "http://LOCALHOST:4577"
    s3             = "http://localhost:4572"
    secretsmanager = "http://localhost:4584"
    ses            = "http://localhost:4579"
    sns            = "http://localhost:4575"
    sqs            = "http://localhost:4576"
    ssm            = "http://localhost:4583"
    stepfunctions  = "http://localhost:4585"
    sts            = "http://localhost:4592"
    ec2            = "http://localhost:4597"
  }
}
