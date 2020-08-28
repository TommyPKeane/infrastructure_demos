# Basic Demo: Nginx

This basic Terraform demo is based on the introduction provided in the Terraform documentation.

[Terraform Tutorial](https://learn.hashicorp.com/tutorials/terraform/aws-build)

## Running

1. `teraform init;`
1. `terraform apply;` -- Answer "yes"
1. Open Browser to `http://localhost:8080` to see Nginx intro.

The confirmation on `apply` is so that you can verify the `terraform plan` output and have a chance to confirm that you want all the steps to be executed as shown.

## Inspecting

Once the Docker container (`tutorial`) is up and running, you can inspect it with the following commands.

To check the running containers: `docker container ls`

To check the logs from Nginx from inside the container: `docker logs tutorial`

To get a DOT file definition of the graph of the running resources (containers/apps): `terraform graph`

To verify the `main.tf` Terraform configuration file's syntax is valid: `terraform validate`

To see the runtime plan for Terraform: `terraform plan` -- this will print-out to `stdout` and shows all the steps/processes that will be initiated by Terraform to deploy/establish the infrastructure. The plan file is much more detailed than the `main.tf` file, and can be a useful artifact to track in your VCS if you want to see detailed information about what Terraform is deploying.

## Teardown

1. `terraform destroy;` -- Answer "yes"

Note that this will also delete the Docker image(s) that you had built and created containers with.

The confirmation on `destroy` is so that you can verify the `terraform plan` output that's showing the undo steps that will be taken to stop and remove the running container(s). This is shown so that you have a chance to confirm that you want all the depicted steps to be executed as shown.
