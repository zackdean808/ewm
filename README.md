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
   TODO: Add 3000/9000 to the sgs 

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
  	TODO: ADD passwordless sudo to the users 
  	```
   	ansible-playbook -i inventory/production.yml roles/common/users.yml -u ec2-user -b
   	```
- Make dir on the ansible host for cloned repos 
- Install ansible and git on the ansible host
	```
	dnf install ansible git -y
 	```
- Get the prometheus package on the ansible host 
  	```
   	wget https://github.com/prometheus/prometheus/releases/download/v2.53.0/prometheus-2.53.0.linux-amd64.tar.gz
	```
- Start Prometheus in the background on the ansible host
  	```
   	nohup /home/ansible/prometheus-2.53.0.linux-amd64/prometheus --config.file=prometheus.yml 2>&1 &
   	```
- Get Grafana on the ansible host 
	```
 	sudo yum install -y https://dl.grafana.com/oss/release/grafana-11.0.0-1.x86_64.rpm
 	```
 - Set up ssl for grafana for self signed
	```
 	https://grafana.com/docs/grafana/latest/setup-grafana/set-up-https/
 	```
 - Change the admin password
	```
 	grafana-cli admin reset-admin-password $NEWPASS
 	```
 - Update the SG to allow traffic on port 3000 This needs to be done manually. Should be done as part of the TF
 - Import Dashboard 

3. Documentation
   - I have implemented all the functionality but the automatic deployments of node exporter and configuration of prometheus. I would do these
     with Ansible and Jinja since the configuration of prometheus.yml is pretty straight forward. I'd also like to implement a service file for
     prometheus so we can stop and start it quickly.
   - Still need to implementthe node exporter on the other node. This way I oculd agg all the incoming data and have one pane view of everything. Also see the TODO:
     since these show additional functionality I would like to have but ran out of time. Other take aways in my design was that if I continued to scale I'd be sending the node_exporter data over the VPC.
     This keeps it kind of simple and we'd only need one cert for the grafana front end. 
   - I think I spent about 6 hours total. I'm not sure, I had fun.
   - Not having centralized key managment or sso to quickly log into boxes. I had to copy keys around to avoid using passwords. This was probably the biggest time sync.
     Need to build a custom AMI wiht auth aready built in. Since my laptop was refreshedwith a new os I had to spend sometime configuring my env and finding missing packages.  
   - The keys are the worst part, they don't scale and now you're stuck with it. Also not configuing the sg's for 3000 right away borked thigs. Also I'd like to stick an nginx in front or have
     real certs for 443/3000 over ssl
   - More automation around the configuring of grafana.
   - I tested by doing, run into issues and debug.
   

# Tasks:
### Task 1 - Terraform / Ansible Server ###

- [x] Use Terraform to create afree tier EC2 instance and deploy Ansible and Terraform.

### Task 2 - Observability Server ###

- [x] Using the Terraform / Ansible server create afree tier EC2 instance and deploy Ansible and Terraform.
- [x] Deploy an instance of [Prometheus](https://prometheus.io/download/)
- [x] Deploy an instance of [OSS Grafana](https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1)

### Task 3 - Documentation ###

- [x] The instructions on how to create / deploy / configure the infrastructure and applications.
- [x] The functionality that you have implemented.
- [x] What still remains to be implemented.
- [x] How much time you spent on the exercise.
- [x] What problems you encountered and what you did to overcome / work around them.
- [x] What technical debt you have added to your solution.
- [x] What improvements / additional functionality could be added to the solution?
- [x] How you tested your solutions.


# Validation / Testing 
## Terraform 
1. Run `terraform fmt` and `terraform validate` to verify that there are no issues with the formatting
2. Verify that init and apply return no errors. Fix errors as they present themselves. 
3. Verify the hosts are reachable over ssh by `ssh -i ../keys/ewm-key-pair.pem ec2-user@ip`
4. Verify in the aws console the that hosts are online and report no issues with health checks

## Ansible 
1. Built a simple playbook to create two users and copy their keys to the hosts
2. Testing was done as I was building it against the hosts. Ideally I would have liked to test against

