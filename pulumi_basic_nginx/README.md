# Demo - Pulumi Python - Nginx

This is a simple demo using __Pulumi__ with Python to create and run an Nginx container that will be externally bound to `0.0.0.0:8080` (`localhost:8080`). This simple demo should help convey the basics of __Pulumi__ and how to create and deploy a container, locally. __Pulumi__ supports Google Cloud, Azure, and AWS.

## Docker Image

We are using the `nginx:latest` image as supplied by the default, public Docker Hub.


## Setup

> __Note__: The following steps will create a new project that is locked by a password. You can set a password when prompted, or you can actually just press `RETURN`/`ENTER` and you will have a blank password/passphrase. Then whenever a Pulumi command for this project asks for your password, you can just press `RETURN` or `ENTER` and it should continue forward. This is not recommended in production or true development, you should use strong credentials and use an encrypted "wallet" to safeguard your credentials. We just wanted to mention this because if you're just messing around with Pulumi (as we are) with this first project, it might be a little easier to just have a blank/dummy password.

1. `pulumi login --local` to put Pulumi into local mode (doesn't require Pulumi Cloud login credentials).
1. `pulumi new python` to create a Python-based Pulumi project.
1. Modify `requirements.txt` to include `pulumi-docker` package.
1. Modify `__main__.py` to pull down the image and create the container.

## Running

1. `pulumi up`
1. Answer "yes" to proposed changes.
1. Open Browser to `http://localhost:8080` to get to the Nginx intro page.

## Inspecting

Once the Docker container (`nginx-...`) is up and running, you can inspect it with the following commands.

To check the running containers: `docker container ls` or `docker ps`

To check the logs from Nginx from inside the container: `docker logs nginx-...` (use one of the above commands to get the container name).

## Teardown

1. `pulumi destroy;` -- Answer "yes"
