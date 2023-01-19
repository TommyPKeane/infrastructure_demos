# Module State Management ("Backend" Location)
#
# By default, Terraform will assume the current Workspace to be the `default`
# Workspace, and will create a State File for that Workspace named
# `default.tfstate` when running the `plan` and `apply` steps.
#
# The `.tfstate` file(s) define all of Terraform's known information about the
# Infrastructure managed by this code and any dependencies through Providers. It
# is assumed that nothing exists unless it is tracked in the `.tfstate` file, so
# Terraform will `plan` itself against the current contents of the relevant
# `.tfstate` file for the current Workspace.
#
# ⚠️ For "Production Quality" infrastructure management, ddeally state would not
#   be stored locally, because then it cannot be shared by a Team or
#   Organization, and would instead be remotely stored somewhere like an AWS S3
#   Bucket that is managed and protected by the Organization/Team. Having
#   storage with a version history for the State File is also recommended so
#   that you can rollback to a previous snapshot of the state file in case of
#   erroneous actions or when the Infrastructure is 😭 modified manually without
#   Terraform 😭.
#
# ⚠️ Note that in that "Production Quality" situation, access management to the
#   common Storage Location for the State File will thus correspond directly to
#   access management/restrictions for actually running the Terraform `plan` and
#   `apply` steps related to this code. If a developer doesn't have access to
#   the State File, then they wouldn't be able to run the Terraform commands
#   which reference against it. Usually, in a well-established "Production
#   Quality" situation, this is preferable, because then you mitigate risk to
#   errors happening against the state file, and you enforce that a discrete,
#   managed Service (like a Cloud Builder) be used to run the Terraform code and
#   be the exclusive accessor of the State File.
#
# This file would thus provide a `backend` definition block for Terraform
# to point to the location in AWS S3 (or Google Clou1d Storage, or wherever) to
# store the State File.
