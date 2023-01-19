# AWS Identity Access Management (IAM) Policies
#
# Policies related to creating/running an EC2 Instance
#
# This creates two resources:
# 1. An example, new, custom IAM Role for managing the permissions related to the new EC2 Instance
# 1. An example, new, custom IAM Policy for applying the permissions to the new EC2 Instance
#
# References:
# - https://devopslearning.medium.com/aws-iam-ec2-instance-role-using-terraform-fa2b21488536
# - https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_role_policy
# - https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_role

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.test_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
         "ec2:RunInstances",
         "ec2:AssociateIamInstanceProfile",
         "ec2:ReplaceIamInstanceProfileAssociation"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "iam:PassRole",
      "Resource": "arn:aws:iam::${var.aws_account_id}:role/DevGroup*"
    }
  ]
}
EOF
}
