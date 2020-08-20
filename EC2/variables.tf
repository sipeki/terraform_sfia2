variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "This variable states the ami for your EC2"
  default     = "ami-07ee42ba0209b6d77"
}

variable "instance_count" {
  description = "Create 2 instance"
  default = "2"
}

variable "instance_tags" {
  type    = list
  default = ["Manager", "Worker"]
}

variable "key_name" {
  description = "This variable states the key name for your EC2"
  default     = "simon"
}

variable "subnet_id" {
  description = "subnet ID for EC2"

}

variable "sg_ids" {
  description = "security group ID for EC2"

}

variable "name" {
  description = "Name of EC2 instance "
  default = "EC2200820"
}



variable "enable_public_ip" {
  de

}

variable "user_data" {
  description = "Script "

}