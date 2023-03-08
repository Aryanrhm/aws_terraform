resource "aws_efs_mount_target" "efs_mount" {
  file_system_id = var.efs_id
  subnet_id      = var.efs_subnet_id
  security_groups = ["${var.sg_id}"]
}

#Mount EFS volume in EC2 instance
resource "null_resource" "efs_install" {
  depends_on = [
    aws_efs_mount_target.efs_mount
  ]
 connection {
    type     = "ssh"
    user     = ${var.ssh_user}
    private_key = var.ec2_instance_key
    host     = var.ec2_instance_ip
  }
 provisioner "remote-exec" {
    inline = [
      "sudo yum install -y amazon-efs-utils",
      "sudo mkdir -p ${var.mount_path}",
      "sudo echo ${var.efs_id}",
      "sudo mount -t efs ${var.efs_id}:/ ${var.mount_path}",
    ]
  }
}