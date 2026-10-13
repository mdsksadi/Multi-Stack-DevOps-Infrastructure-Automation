resource "aws_key_pair" "devops" {
  key_name   = "${var.project_name}-key"
  public_key = file(pathexpand("~/.ssh/multi-stack-devops.pub"))

  tags = {
    Name = "${var.project_name}-key"
  }
}