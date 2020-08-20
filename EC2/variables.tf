variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "This variable states the ami for your EC2"
  default     = "ami-07ee42ba0209b6d77"
}

variable "key_name" {
  description = "This variable states the key name for your EC2"
  default     = "simon"
}

variable "subnet_id" {
  description = "subnet ID for EC2"

}

variable "name" {
  description = "Name of EC2 instance "
  default     = "SFIA2"
}

variable "enable_public_ip" {
  description = "Enable if EC2 instace should have public ip address"
  default     = true
}

variable "vpc_security_group_ids" {
  description = "VPC Security Group IDs"
}

variable "user_data" {
  description = "Script "

}