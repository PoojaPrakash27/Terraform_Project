# This resource block defines an AWS EC2 instance with the following properties:

resource "aws_instance" "webserver" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.SG-SSH-id, var.SG-HTTP-id]
  iam_instance_profile   = var.EC2_instance_profile

  tags = {
    Name = var.instance_name
  }

  # The connection block uses SSH to connect to the instance using the private key file and the instance's public IP.

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./${var.key_name}")
    host        = self.public_ip
  }

  # The provisioner block runs a series of commands on the instance to:
  # - Install unzip and AWS CLI
  # - Download a file from an S3 bucket specified by the variables `bucket_name` and `app_file`
  # - Update the instance and install Python 3 and pip
  # - Install Flask using pip
  # - Create and run a script to start the application

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y unzip",
      "curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'",
      "unzip awscliv2.zip",
      "sudo ./aws/install",
      "aws s3 cp s3://${var.bucket_name}/${var.app_file} /home/ec2-user/${var.app_file}",
      "sudo yum update -y > /tmp/remote_output.log 2>&1",
      "sudo yum install python3 -y >> /tmp/remote_output.log 2>&1",
      "sudo yum install python3-pip -y >> /tmp/remote_output.log 2>&1",
      "sudo pip3 install flask >> /tmp/remote_output.log 2>&1",
      "echo '#!/bin/bash' > /home/ec2-user/run_app.sh",
      "echo 'nohup sudo python3 /home/ec2-user/${var.app_file} &' >> /home/ec2-user/run_app.sh",
      "chmod +x /home/ec2-user/run_app.sh",
      "sudo /home/ec2-user/run_app.sh",
      "sleep 5"
    ]
  }

}

# This resource block defines a `null_resource` named `fetch_logs` which is used to fetch logs from a remote EC2 instance.
# The `depends_on` argument ensures that this resource is created only after the `aws_instance.webserver` resource is created.
#
# resource "null_resource" "fetch_logs" {
#   depends_on = [aws_instance.webserver]

#   provisioner "local-exec" {
#     command = "scp -o StrictHostKeyChecking=no -i ./Puja-2-key ec2-user@${aws_instance.webserver.public_ip}:/tmp/remote_output.log ./${var.instance_name}.log"
#   }
# }





