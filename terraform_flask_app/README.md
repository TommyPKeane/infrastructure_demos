# Demo: Custom Flask App

This Terraform demo expands on the __Basic Nginx Demo__ by using a custom Docker image as defined by a local Dockerfile to deploy a pre-configured container running Python 3.8, `flask`, `uwsgi`, and Nginx. This is a simple approach to do your own Python webapp deployment, where you could build out the provided Python code and static/template files run your own website or API.

For the purposes of this demo, we'll use `pystache` to dynamically fill-in template files that will be used for the HTTP responses to populate the pages/requests to the webserver.

## Docker Image

Here you can find the details of the [`tiangolo` Docker Image](https://github.com/tiangolo/uwsgi-nginx-flask-docker) for running `uwsgi`, Nginx, and `flask` all in a single container.

The image is preconfigured to provide a simple deployment, but we've used the `setup.sh` script to modify the image so that we can override the default app with our custom application.

## Running

1. `./setup.sh`
1. `teraform init;`
1. `terraform apply;` -- Answer "yes"
1. Open Browser to `http://localhost:8080` to get to the intro page (endpoint).

The confirmation on `apply` is so that you can verify the `terraform plan` output and have a chance to confirm that you want all the steps to be executed as shown.

## Inspecting

Once the Docker container (`tutorial`) is up and running, you can inspect it with the following commands.

To check the running containers: `docker container ls`

To check the logs from `flask` and Nginx from inside the container: `docker logs demo_webapp`

To get a DOT file definition of the graph of the running resources (containers/apps): `terraform graph`

To verify the `main.tf` Terraform configuration file's syntax is valid: `terraform validate`

To see the runtime plan for Terraform: `terraform plan` -- this will print-out to `stdout` and shows all the steps/processes that will be initiated by Terraform to deploy/establish the infrastructure. The plan file is much more detailed than the `main.tf` file, and can be a useful artifact to track in your VCS if you want to see detailed information about what Terraform is deploying.

## Teardown

1. `terraform destroy;` -- Answer "yes"

Note that this will also delete the Docker image(s) that you had built and created containers with.

The confirmation on `destroy` is so that you can verify the `terraform plan` output that's showing the undo steps that will be taken to stop and remove the running container(s). This is shown so that you have a chance to confirm that you want all the depicted steps to be executed as shown.
