# Input Variables for this Module
#
# Variables are defined here and can be accessed _via_ the `var` keyword with
# the `.` (dot) operator.
#
# The `terraform.tfvars` file provides the values for all the defined variables
# here. Variables may or may not have a `default` value. If there is no
# `default` value, then the variable must be provided at value when the
# Terraform `plan` step is being run. This value can be provided through the
# commandline or through the `terraform.tfvars` file. It's often more convenient
# to track values in the `terraform.tfvars` file, though you should never track
# (in plain text) any credential values.
#
# If you want to change the values of any of these variables for this example,
# please make edits in the `terraform.tfvars` file.
#
# - Module Input Variable Declarations: `variables.tf`
# - Module Input Variable Definitions: `terraform.tfvars`

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID (https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-identifiers.html#FindAccountId)"
  validation {
    condition     = can(regex("^[0-9]{12}$", var.aws_account_id))
    error_message = "AWS Account ID must be a 12 Digit Number"
  }
}

variable "ami_image_name" {
  type = string
}

variable "ami_virtualization_type" {
  type = string
}

variable "ami_image_owner_id" {
  type = string
}
