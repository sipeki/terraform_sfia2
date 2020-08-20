resource "aws_instance" "docker" {
  count = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance
  key_name                    = var.key_name
  associate_public_ip_address = var.enable_public_ip
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = element(var.sg_ids, count.index)
  user_data = var.user_data
  tags = {

    name  = element(var.instance_tags, count.index)
    batch = "sfia2"

  }
}