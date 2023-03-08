#Create efs
resource "aws_efs_file_system" "cluster-efs" {
  creation_token = "${var.cluster_name}.efs"
  throughput_mode = var.trpt_mode
  performance_mode = var.perf_mode
tags = {
    Created_By = "Terraform"
  }
}


# #Mount EFS volume in EC2 instance and clone code from GitHub
# resource "null_resource" "local2" {
#  depends_on = [
#     aws_efs_mount_target.alpha,
#   ]
#  connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     private_key = tls_private_key.test.private_key_pem
#     host     = aws_instance.myin.public_ip
#   }
#  provisioner "remote-exec" {
#     inline = [
#       "sudo yum install -y amazon-efs-utils",
# "sudo mount -t efs ${aws_efs_file_system.myefs.id}:/ /var/www/html",
#       "sudo rm -rf /var/www/html/*",
#       "sudo curl https://github.com/Ds123-wq/cloudtask-2/blob/master/index.html  > index.html ",
#         "sudo cp index.html   /var/www/html/" ,
#     ]
#   }
# }