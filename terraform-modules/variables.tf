variable "ami_id" {
  description = "The ID of the AMI"
  type        = string
}
variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}