# AWS Amazon Machine Instance (AMI)
#
# The `data.aws_ami` element here is a reference to the Ubuntu Docker Image
# that is referenced _via_ the configurable input arguments (defined between
# the declarations in the `variables.tf` file and the values in the
# `terraform.tfvars` file).
#
# References:
# - https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/instance
# - https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/ami

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_image_name]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_virtualization_type]
  }

  owners = [var.ami_image_owner_id]
}
