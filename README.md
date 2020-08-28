# "Infrastructure as Code" Demos

For contemporary cloud deployments, there's a common approach to use a library, framework, or scripting language to implement what's referred to as "Infrastructure as Code". Things like IP Addresses, ports, available connections, runtime applications, and Docker containers that make up the infrastructure of a cloud deployment. These contemporary "Infrastructure as Code" demos provide the means to manage these configurations through a simple text file that can be committed to a Version Control System.

Most will use YAML or JSON files for configuration, but some approaches use scripting languages to more programmatically establish the infrastructure. Ultimately, though, in all approaches, the result is meant to be similar to the concept of "lock files". You should get a fixed infrastructure as established by the configuration file(s) or script(s), and you should be able to commit them to your VCS. Then as bugs are found/resolved, or if you need to scale up or scale down, you should be able to track those infrastructure changes through your VCS.

All of this means that you no longer need to rely on UI-based settings selections, since you should be able to design and deploy your infrastructure through scripts and files that can be shared, duplicated, and monitored for changes. This adds consistency, extensibility, and sensible management to your cloud infrastructure.

## Terraform

Prequisites:

- Install Docker
- Install Terraform
