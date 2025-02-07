resource "aws_instance" "bastion" {
  ami                    = "data.aws_ssm_parameter.bastion_sg_id.value" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  subnet_id = local.public_subnet_id
  tags = merge(
    var.common_tags,
    {
        name = "${var.project_name}-${var.environment}-bastion"
}
    }
  )
    
}