# AWS EC2 Instance
#
# This creates an EC2 Instance named `"web"`, which references the
# `aws_iam_role_policy` defined in the `iam.tf` file, and uses the Docker Image
# from the `data` element defined in the `ami.tf` file.
#
# References:
# - https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/instance

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Example"
  }

  iam_instance_profile = aws_iam_role_policy.test_policy.name
}
