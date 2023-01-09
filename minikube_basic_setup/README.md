# Demo: Introduction to Setup Minikube on macOS

This demo uses Terraform (`1.3.7` _via_ `tfswitch` with `direnv`) to show how to spin-up a Cluster running with `minikube`, locally.

Note that using Terraform is not the only way to do this, but that was just the choice made for this demo.

<!-- MarkdownTOC -->

- Prerequisites \(Installed Tools Needed\)
    - Docker \(Container Driver\)
    - Minikube \(Kubernetes\) Configuration
- References

<!-- /MarkdownTOC -->

## Prerequisites (Installed Tools Needed)

All of these tools can be installed on macOS with `brew` ([Homebrew](https://brew.sh))

- `tfswitch`
- `direnv`
- `minikube`
- Container Driver(s) - One of the following:
    - `docker`
    - `hyperkit`
    - `parallels`
    - `vmware`
    - `virtualbox`
    - `qemu2`
    - `podman`

### Docker (Container Driver)

`minikube` needs a containerization driver system available in the current environment to be able to run Kubernetes (the container orchestration service) and allow for any container deployments.

The default, and currently most typical, service to provide this is `docker`, which will need to be installed and should be running on your system before starting `minikube`, otherwise you may see an error like this:

```bash
❯ minikube start
😄  minikube v1.28.0 on Darwin 12.6.1 (arm64)
👎  Unable to pick a default driver. Here is what was considered, in preference order:
💡  Alternatively you could install one of these drivers:
    ▪ docker: Not installed: exec: "docker": executable file not found in $PATH
    ▪ hyperkit: Not installed: exec: "hyperkit": executable file not found in $PATH
    ▪ parallels: Not installed: exec: "prlctl": executable file not found in $PATH
    ▪ vmware: Not installed: exec: "docker-machine-driver-vmware": executable file not found in $PATH
    ▪ virtualbox: Not installed: unable to find VBoxManage in $PATH
    ▪ qemu2: Not installed: exec: "qemu-system-aarch64": executable file not found in $PATH
    ▪ podman: Not installed: exec: "podman": executable file not found in $PATH

❌  Exiting due to DRV_NOT_DETECTED: No possible driver was detected. Try specifying --driver, or see https://minikube.sigs.k8s.io/docs/start/
```

### Minikube (Kubernetes) Configuration

For future use of Kubernetes, you'll want to make sure that you have a configuration file setup on your system with your local user, so that you can set any necessary configuration options.

The easiest way to make sure that you have these files, without risk of modifying any configuration you already have setup, is to run the following commands (in order):

1. `mkdir -p ~/.kube`
1. `touch ~/.kube/config`

If you know that you have an alternative configuration, like for a Cloud System deploy of Kubernetes (Cluster(s)) that you don't want to modify, you could always make a new configuration file and then edit the `providers.tf` in this demo, to reference that new file:

1. `touch ~/.kube/new-demo-config`
1. Edit the `providers.tf` to set the `config_path` value to this new path: `~/.kube/new-demo-config`

For this example, since we can't create a Cluster directly through Terraform, we've created a local `minikube.config` file to manage the configuration. If you want to move this to your `~/.kube/config`, feel free; just don't forget to also update the `providers.tf` file.

## References

- https://minikube.sigs.k8s.io/docs/start/
- https://kubernetes.io/docs/reference/kubectl/
- https://dev.to/chefgs/deploy-kubernetes-resources-in-minikube-cluster-using-terraform-1p8o
