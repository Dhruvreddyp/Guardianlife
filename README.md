# Guardianlife
Prereq steps
Setup git repo, setup git creds as needed and add rsa.pub to github ssh key
clone Git repo

1. launch ec2, deploy nginx, with hello world and use terraform

Answer- 
Terraform code requires the provider, ec2 instance, and sg for ec2 instance. 
We should probably create an s3 bucket in order to store tf state file and for dynamo.db lock
Instead of using ansible to install nginx, we can bootstrap user data to download and run nginx via terraform. 
Also instead of 1 large tf file, create modules to make it simpler. 
Instructions don't mention a VPC/networking requirements but lets at the very least create some vpc and subnets. 

#TODO 
Branching Strategy for tf modules??
Networking?
security groups??
ansible? + template? + defaults?
terraform defaults?
Incorporate everything into a main.tf which will pull in each of the modules such as networking, ec2, sg's etc. 
