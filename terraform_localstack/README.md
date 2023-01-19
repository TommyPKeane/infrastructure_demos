# Demo: Terraform + Localstack _via_ Python

<!-- MarkdownTOC -->

- Setup
- How to Run
- References

<!-- /MarkdownTOC -->


## Setup

⚠️ Assuming macOS system with `brew` ([Homebrew](https://brew.sh)):

- AWS CLI: https://aws.amazon.com/cli/
- `direnv`: `brew install direnv`
- `tfswitch`: `brew install warrensbox/tap/tfswitch`
- `pyenv`: `brew install pyenv`
- Docker: https://www.docker.com/
- `localstack` (_via_ Docker): https://hub.docker.com/r/localstack/localstack

## How to Run

This example uses `tflocal` instead of `terraform`, for using `localstack` and we'll be using two separate terminals, so that we can monitor the `localstack` logs (note that you can use Tabs instead of Windows with iTerm2):

1. New Terminal:
    1. Make sure Docker (Docker Engine alone, or Docker Engine _via_ Docker Desktop) is running
    1. From any directory create a `localstack` container:
    ```
    docker run -it -p 4500-4600:4500-4600 -p 8080:8080 --expose 4572 localstack/localstack:1.3.1
    ```
1. New Terminal:
    1. Start in the same directory as this `README`
    1. `direnv allow`
    1. `pyenv install` (Optional, if you don't already have the `.python-version` version installed)
    1. `pip install --upgrade pip`
    1. `pip install poetry`
    1. `poetry install`
    1. `cd ./ec2_instance/`
    1. `tflocal validate`
    1. `tflocal init`
    1. `tflocal plan`


## References

- AWS CLI: https://aws.amazon.com/cli/
- `localstack` Docker Image: https://hub.docker.com/r/localstack/localstack
- https://stackoverflow.com/questions/49562015/how-to-attach-iam-roles-to-ec2-instances-so-they-can-pull-an-specific-image-from
- https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/instance
- https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/ami
- https://devopslearning.medium.com/aws-iam-ec2-instance-role-using-terraform-fa2b21488536
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html
