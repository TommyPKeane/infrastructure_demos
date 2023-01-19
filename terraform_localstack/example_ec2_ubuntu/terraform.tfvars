# Definitions for Input Variables (from the `variables.tf`)
#
# Note that the list of `ami_image_name` values with `localstack` can be found
# by using the following command referencing the Canonical Owner ID:
#
# ```bash
# awslocal ec2 describe-images --owners 099720109477
# ```

aws_account_id          = "123456789012" # Fake
ami_image_name          = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20170721"
ami_virtualization_type = "hvm"
ami_image_owner_id      = "099720109477" # Canonical
