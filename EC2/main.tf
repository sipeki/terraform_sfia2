resource "aws_instance" "docker" {
  count = "${var.instance_count}"
  ami                         = var.ami_id
  instance_type               = var.instance
  key_name                    = var.key_name
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_ids

  tags = {

    name  = "${element(var.instance_tags, count.index)}"
    batch = "sfia2"

  }
}