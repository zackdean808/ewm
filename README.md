## Description
This is the EWM take home test, given to me by Steve Clarke. 
It's a three part test that is broken down into three steps. 

## Installation 
Terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

AWS CLI 
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


## How to run:
1. Initialize all the terraform

a.
```
	cd shared
	terraform init
	terraform apply
``` 
b. 
```
	cd ../node_host
	terraform init
	terraform apply
```
c. 
```
	cd ../ansible_host
	terraform init
	terraform apply
```
2. 
3. 

## Tasks:
### Task 1 - Terraform / Ansible Server ###

[] Use Terraform to create afree tier EC2 instance and deploy Ansible and Terraform.

### Task 2 - Observability Server ###

[] Using the Terraform / Ansible server create afree tier EC2 instance and deploy Ansible and Terraform.
[] Deploy an instance of [Prometheus](https://prometheus.io/download/)
[] Deploy an instance of [OSS Grafana](https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1)

### Task 3 - Documentation ###

- The instructions on how to create / deploy / configure the infrastructure and applications.
- The functionality that you have implemented.
- What still remains to be implemented.
- How much time you spent on the exercise.
- What problems you encountered and what you did to overcome / work around them.
- What technical debt you have added to your solution.
- What improvements / additional functionality could be added to the solution?
- How you tested your solutions.


