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

Steps- 
TF Init, plan, apply as needed. 

Then tf destroy as needed. 


2. Python script to run in server 1 in one aws account to publish sns topic in different aws account using datetime stamp. 

Here's the approach:- 
In terraform, use the module from the previous question to retrieve ami/region/networking for ec2 and sg as needed. 

Create the below next. 

SNS queue with topic and subscription
configure IAM toi allow SNS
Create ec2 and attach IAM role to instance. 

Create python script to publish SNS topic. 
Another python script to write the message to a file would be needed. 

Create tf.vars for account A
create tf vars for account B. 

TF Init, plan, apply as needed. 
Run python script

The code for this definitely has a few errors such as missing tf.vars for the different accounts.
Also, I ran into error in tf with SNS before so added the depends on portion in sns because we cannot have a subscription without a queue. 

Main items to note here are that the sns items are cross account. 
In terms of usecases for a question like this might be related to having a monitoring account setup and we need logfiles from one server to another with datatimestamps. 
In this scenario, I would include atomic writes in my Python script which creates the file.

3. Create infra for ec2 using amazonlinux2
Bash script to check for tomcat and schedule service for 6am every week day. 

Approach- 
re-use the ec2 tf from the first module, modify as needed. 
Create user data in ec2-instance with the user data to install and start tomcat. 
Create the bash shell script to check if tomcat is running and if not, start it. 
Cron job to run the tomcat script using crontab -e 
@reboot /home/ec2-user/check_tomcat.sh
@0 6 * * 1-5 /home/ec2-user/check_tomcat.sh

4. Find and replace to .new via a Bash shell

Seems straight forward- find and replace shell script for a file. 
Need to take in an input file, replace it with an output file. 

I'm going to resort to creating a python script instead of a bash script for this. 

Check 

In this scenario, I'm prompting the user for an input file using the below:- 
input_file = input("Enter the path to the input file: ")

run the script using pyhthon3 search-replacefile.py