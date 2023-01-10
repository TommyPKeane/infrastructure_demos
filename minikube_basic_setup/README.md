# Demo: Introduction to Setup Minikube on macOS

This demo uses Terraform (`1.3.7` _via_ `tfswitch` with `direnv`) to show how to spin-up a Cluster running with `minikube`, locally.

Note that using Terraform is not the only way to do this, but that was just the choice made for this demo.

<!-- MarkdownTOC -->

- Prerequisites \(Installed Tools Needed\)
    - Minikube \(Kubernetes\) Configuration
- Run this Demo
    - 1. Configure and Start `minikube`
    - 2. Run Terraform Code
- References
- Troubleshooting
    - `minikube` Won't Start \(`kubectl` mismatch\)
    - Missing a Containerization System \(`minikube` Driver\)

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

### Minikube (Kubernetes) Configuration

For future use of Kubernetes, you'll want to make sure that you have a configuration file setup on your system with your local user, so that you can set any necessary configuration options.

The easiest way to make sure that you have these files, without risk of modifying any configuration you already have setup, is to run the following commands (in order):

1. `mkdir -p ~/.kube`
1. `touch ~/.kube/config`

If you know that you have an alternative configuration, like for a Cloud System deploy of Kubernetes (Cluster(s)) that you don't want to modify, you could always make a new configuration file and then edit the `providers.tf` in this demo, to reference that new file:

1. `touch ~/.kube/new-demo-config`
1. Edit the `providers.tf` to set the `config_path` value to this new path: `~/.kube/new-demo-config`

For this example, since we can't create a Cluster directly through Terraform, we've created a local `minikube.config` file to manage the configuration. If you want to move this to your `~/.kube/config`, feel free; just don't forget to also update the `providers.tf` file.

## Run this Demo

### 1. Configure and Start `minikube`

```
❯ minikube start
😄  minikube v1.28.0 on Darwin 12.6.1 (arm64)
✨  Using the docker driver based on existing profile
❗  docker is currently using the stargz storage driver, consider switching to overlay2 for better performance
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
    > gcr.io/k8s-minikube/kicbase:  0 B [________________________] ?% ? p/s 11s
🔄  Restarting existing docker container for "minikube" ...
    > kubelet.sha256:  64 B / 64 B [-------------------------] 100.00% ? p/s 0s
    > kubectl.sha256:  64 B / 64 B [-------------------------] 100.00% ? p/s 0s
    > kubeadm.sha256:  64 B / 64 B [-------------------------] 100.00% ? p/s 0s
    > kubectl:  41.56 MiB / 41.56 MiB [------------] 100.00% 19.70 MiB p/s 2.3s
    > kubelet:  104.74 MiB / 104.74 MiB [----------] 100.00% 38.53 MiB p/s 2.9s
    > kubeadm:  40.56 MiB / 40.56 MiB [------------] 100.00% 10.18 MiB p/s 4.2s

    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by defaultbash
```

### 2. Run Terraform Code

## References

- https://minikube.sigs.k8s.io/docs/start/
- https://kubernetes.io/docs/reference/kubectl/
- https://dev.to/chefgs/deploy-kubernetes-resources-in-minikube-cluster-using-terraform-1p8o


## Troubleshooting

If you end-up with `minikube` not starting, here are some troubleshooting tips/steps I was able to figure out to get things working for me, when they didn't work immediately on the first try:

```bash
❯ minikube status
E0109 14:53:12.070179   40067 status.go:415] kubeconfig endpoint: extract IP: "minikube" does not appear in ~/.kube/config
minikube
type: Control Plane
host: Running
kubelet: Stopped
apiserver: Stopped
kubeconfig: Misconfigured


WARNING: Your kubectl is pointing to stale minikube-vm.
To fix the kubectl context, run `minikube update-context`
```

When you try to start `minikube` you may notice something like this, and then a ton of printed-out information:

```bash
❯ minikube start
😄  minikube v1.28.0 on Darwin 12.6.1 (arm64)
✨  Automatically selected the docker driver
❗  docker is currently using the stargz storage driver, consider switching to overlay2 for better performance
📌  Using Docker Desktop driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
    > gcr.io/k8s-minikube/kicbase:  347.52 MiB / 347.52 MiB  100.00% 22.58 MiB
    > gcr.io/k8s-minikube/kicbase:  0 B [________________________] ?% ? p/s 11s
🔥  Creating docker container (CPUs=2, Memory=6100MB) ...
✋  Stopping node "minikube"  ...
🛑  Powering off "minikube" via SSH ...
🔥  Deleting "minikube" in docker ...
🤦  StartHost failed, but will try again: creating host: create: provisioning: ssh command error:
command : sudo mkdir -p /lib/systemd/system && printf %s ...
```

Try the following subsections to see if you have any similar issues to what I had, and how to resolve them.

### `minikube` Won't Start (`kubectl` mismatch)

Fun discovery: If you install `kubectl` through `brew` (`kubernetes-cli`), and then you also install Docker on macOS, you could end-up with two different installs (aliases) of `kubectl`:

- `/usr/local/bin/kubectl` as a symbolic link (alias) to `` as the Docker install
- `/opt/` as the `brew` install

With lots of frustration, I found that by inspecting the failure logs, there was a mismatch of the `kubectl` version when I ran the `kubectl version` command and the expected version I saw when I ran `brew reinstall kubectl`.

This lead me to attempt to see `which kubectl` and then realize that there was this confusing linkage, especialy when using `ls -alF /usr/local/bin/kube*` to confirm that there weren't multiple versions installed with different names.

To resolve the issue and make sure that my `kubectl` and `minikube` installs (through `brew`) were aligned, I removed the Docker alias (symbolic link) and created a new symbolic link for the `brew` version by running the following commands, in order:

1. Check existing location of `kubectl`: `which kubectl`
1. Check existing Symbolic Link(s): `ls -alF /usr/local/bin/kube*`
1. Remove existing Symbolic Link: `rm /usr/local/bin/kubectl`
1. Create new Symbolic Link: `ln -s /opt/homebrew/bin/kubectl /usr/local/bin/kubectl`
1. Check version: `kubectl version`

⚠️ Note that this can happen even if you make sure that your Docker setup does ___not___ configure its own local Kubernetes cluster. Apparently, even if you don't click the checkbox and enable Kubernetes through Docker 🤷‍♀️, it may just go ahead and install all the tools anyways, and pollute your `PATH` ... which is super fun 😭🤮.

### Missing a Containerization System (`minikube` Driver)

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

Many of these can be installed through `brew`, or you can search online for their official websites and install instructions. I will update this documentation as I try out each version, but so far this example/demo used Docker as the `minikube` driver.
