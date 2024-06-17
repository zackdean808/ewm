# ewm
Tech Test for EWM

## Description
### Tech Test
AWS / Terraform / Ansible / Observability test

## Stories ##

As an SRE <br>
I want to automate the deployment/configuration of an observability stack based on prometheus and grafana <br>
So that I can make myself a cup of coffee and not have to do all the work again! 🤣 <br>

As an SRE <br>
I want to automate the deployment of prometheus scrape target configuration <br>
So that I can make myself a 2nd cup of coffee! 😂 <br>

## Requirements ##

- Automate everything!
- Use Terraform to create two EC2 instances.
- Use Terraform to secure the two EC2 instances.
- Use Ansible to deploy the applications.
- Use Ansible to deploy the configurations.
- Use Ansible Community Collections wherever possible;
  - [community.general.terraform](https://docs.ansible.com/ansible/latest/collections/community/general/terraform_module.html)
  - [Ansible Collection for Prometheus](https://github.com/prometheus-community/ansible)
  - [Ansible Collection for Grafana](https://github.com/grafana/grafana-ansible-collection)
- Create your own git repository and create a suitable directory structure to hold the following;
  - Hcl to create the Terraform / Ansible Server.
  - Playbook and hcl to create / configure the Observability server.
  - Deployment instructions in the READme.md.
- Create a new git branch for each task from the previous task.
- Commit your work **frequently**.
- Create Pull Requests back to main for each task branch.
  - Please **do not** squash the commits for the Pull Requests and **do not** merge them either. We will do a code review when you have finished.
- Do **only** as much as **you** want to do. **do not** feel that you have to complete **all** the tasks, although Task 5 is quite important.
- When you have finished do a `terraform destroy`

### Task 1 - Terraform / Ansible Server ###

- Use Terraform to create afree tier EC2 instance and deploy Ansible and Terraform.

### Task 2 - Observability Server ###

- Using the Terraform / Ansible server create afree tier EC2 instance and deploy Ansible and Terraform.
- Deploy an instance of [Prometheus](https://prometheus.io/download/)
- Deploy an instance of [OSS Grafana](https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1)

## Task 5 - Documentation ##

- The instructions on how to create / deploy / configure the infrastructure and applications.
- The functionality that you have implemented.
- What still remains to be implemented.
- How much time you spent on the exercise.
- What problems you encountered and what you did to overcome / work around them.
- What technical debt you have added to your solution.
- What improvements / additional functionality could be added to the solution?
- How you tested your solutions.


