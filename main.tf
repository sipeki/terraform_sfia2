provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred
}

module "sfia2_vpc" {
  source = "./VPC"

}


# IP address of EC2 used for Terraform development. Could be supplied by Jenkins
module "sg_manager_myip" {
  sg_sfia2_name = "Manager SG For My IP"
  source        = "./SG"
  ip_addresses  = ["81.147.135.237/32"]
  ingress_ports = [22, 8080]
  vpc_id        = module.sfia2_vpc.vpc_id
}

module "sg_manager_open" {
  sg_sfia2_name = "Manager SG Open"
  source        = "./SG"
  ingress_ports = [80]
  vpc_id        = module.sfia2_vpc.vpc_id
}

module "sg_worker_myip" {
  sg_sfia2_name = "Worker SG For My IP"
  source        = "./SG"
  ip_addresses  = ["81.147.135.237/32"]
  vpc_id        = module.sfia2_vpc.vpc_id
}


data "template_file" "init" {
  template = "${file("${path.module}/scripts/setup.sh")}"
}

module "manager_node" {
  source                 = "./EC2"
  name                   = "Manager"
  subnet_id              = module.sfia2_vpc.subnet_a_id
  vpc_security_group_ids = [module.sg_manager_myip.sg_ids, module.sg_manager_open.sg_ids]
  user_data              = data.template_file.init.rendered
}

module "worker_node" {
  source                 = "./EC2"
  name                   = "Worker"
  subnet_id              = module.sfia2_vpc.subnet_a_id
  vpc_security_group_ids = [module.sg_worker_myip.sg_ids]
  user_data              = data.template_file.init.rendered
}