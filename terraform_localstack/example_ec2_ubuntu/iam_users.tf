# AWS Identity Access Management (IAM) Policies
#
# ⚠️ TODO: This is not yet used, but the idea here would be that you should be
# able to create and define Users and User Groups (ideally outside of this
# module/state-file, for separable management), so that User Groups could be
# associated with the desired IAM policy(-ies) for limiting permissions of
# Users in relation to the EC2 Instance(s).

resource "aws_iam_group" "researchers" {
  name = "researchers"
  path = "/"
}

resource "aws_iam_user" "researcher_a" {
  name = "example-researcher"
}

resource "aws_iam_group_membership" "researchers" {
  name = "researchers-membership"

  users = [
    aws_iam_user.researcher_a.name,
  ]

  group = aws_iam_group.researchers.name
}
