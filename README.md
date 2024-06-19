# Description
This is the EWM take home test, given to me by Steve Clarke. 
It's a three part test that is broken down into three steps. 

# Installation 
Terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

AWS CLI 
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# How to run:
1. Initialize all the terraform

- Initalize the shared resorces 
	```
	cd shared
	terraform init
	terraform apply
	``` 
- Initialize the node host 
	```
	cd ../node_host
	terraform init
	terraform apply
	```
- Initialize the ansible host 
	```
	cd ../ansible_host
	terraform init
	terraform apply
	```
2. Create users on the ansible host and the node host so we can ssh from the ansilbe host to the node host to configure it
- Generate the keys
  	```
	ssh-keygen -t ed25519 -C "node@ewm.test.com"
	ssh-keygen -t ed25519 -C "ansible@ewm.test.com"
   	```
- Put the keys in the ```ansible/files```
- Add the hosts to inventory, get the ips from the aws console
  	TODO: Get these with script
- Run the playbook
  	```
   	ansible-playbook -i inventory/production.yml roles/common/users.yml -u ec2-user -b
   	```
-  

# Tasks:
### Task 1 - Terraform / Ansible Server ###

- [x] Use Terraform to create afree tier EC2 instance and deploy Ansible and Terraform.

### Task 2 - Observability Server ###

- [x] Using the Terraform / Ansible server create afree tier EC2 instance and deploy Ansible and Terraform.
- [ ] Deploy an instance of [Prometheus](https://prometheus.io/download/)
- [ ] Deploy an instance of [OSS Grafana](https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1)

### Task 3 - Documentation ###

- [ ] The instructions on how to create / deploy / configure the infrastructure and applications.
- [ ] The functionality that you have implemented.
- [ ] What still remains to be implemented.
- [ ] How much time you spent on the exercise.
- [ ] What problems you encountered and what you did to overcome / work around them.
- [ ] What technical debt you have added to your solution.
- [ ] What improvements / additional functionality could be added to the solution?
- [ ]How you tested your solutions.


# Validation / Testing 
## Terraform 
1. Run `terraform fmt` and `terraform validate` to verify that there are no issues with the formatting
2. Verify that init and apply return no errors. Fix errors as they present themselves. 
3. Verify the hosts are reachable over ssh by `ssh -i ../keys/ewm-key-pair.pem ec2-user@ip`
4. Verify in the aws console the that hosts are online and report no issues with health checks 
