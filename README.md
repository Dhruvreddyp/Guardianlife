# Guardianlife
Prereq steps
Setup git repo, setup git creds as needed and add rsa.pub to github ssh key
clone Git repo

1. launch ec2, deploy nginx, with hello world and use terraform

Answer- 
Terraform code requires the provider, ec2 instance, and sg for ec2 instance. 
We should probably create an s3 bucket in order to store tf state file. 
Instead of using ansible to install nginx, we can bootstrap user data to download and run nginx via terraform. 

