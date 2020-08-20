output "sg_ids" {
  value = [aws_security_group.sg_manager.id, aws_security_group.sg_worker.id]
}