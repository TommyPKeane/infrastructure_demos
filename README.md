# "Infrastructure as Code" Demos

For contemporary cloud deployments, there's a common approach to use a library, framework, or scripting language to implement what's referred to as ["Infrastructure as Code"](https://en.wikipedia.org/wiki/Infrastructure_as_code). Things like IP Addresses, ports, available connections, runtime applications, and Docker containers that make up the infrastructure of a cloud deployment. These contemporary "Infrastructure as Code" demos provide the means to manage these configurations through a simple text file that can be committed to a Version Control System.

Most will use YAML or JSON files for configuration, but some approaches use scripting languages to more programmatically establish the infrastructure. Ultimately, though, in all approaches, the result is meant to be similar to the concept of "lock files". You should get a fixed infrastructure as established by the configuration file(s) or script(s), and you should be able to commit them to your VCS. Then as bugs are found/resolved, or if you need to scale up or scale down, you should be able to track those infrastructure changes through your VCS.

All of this means that you no longer need to rely on UI-based settings selections, since you should be able to design and deploy your infrastructure through scripts and files that can be shared, duplicated, and monitored for changes. This adds consistency, extensibility, and sensible management to your cloud infrastructure.

<!-- MarkdownTOC -->

- Terraform
- Pulumi

<!-- /MarkdownTOC -->


## Terraform

[Terraform](https://www.terraform.io/) is a deployment management system that uses its own scripting language ("HashiCorp Configuration Language") in `*.tf` files to orchestrate and configure deployments. Plans are then generated from these scripts, and the steps of the plans are followed to launch the deployment.

To run any of the __Terraform__ examples, you need to have the following prerequisites available on your system:

- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Pulumi

[Pulumi](https://www.pulumi.com/docs/intro/) is similar to __Terraform__, but there are [key differences](https://www.pulumi.com/docs/intro/vs/terraform/):

- Pulumi supports extant scripting languages (Python, go, _etc._) instead of creating its own.
- Pulumi is thus, arguably, more programmatic with its deployment orchestrations.
- Pulumi, by default, avoids allowing you to do detailed management with the equivalents of the __Terraform__ "State Files". The argument is that this is a lower barrier to entry, and the provide best-practices management for you. But, of course, you're giving away some of the lower-level detailed control, and it's not something that's easily changed once you get deep into a project.

To run any of the __Pulumi__ examples, you need to have the following prerequisites available on your system:

- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Kubernetes (`kubectl`)](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Install Pulumi](https://www.pulumi.com/docs/get-started/install/)
