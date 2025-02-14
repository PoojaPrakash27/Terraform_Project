# This resource block defines an AWS EC2 instance with the following properties:

resource "aws_instance" "webserver" {
  for_each               = var.instances
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = element([for subnet in aws_subnet.subnet : subnet.id], index(keys(var.instances), each.key))
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SSH_Access.id, aws_security_group.HTTP_Access.id]
  iam_instance_profile   = aws_iam_instance_profile.EC2_instance_profile.name

  tags = {
    Name = each.value.instance_name
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y unzip
    curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'
    unzip awscliv2.zip
    sudo ./aws/install
    aws s3 cp s3://${var.bucket_name}/${element(var.apps, index(keys(var.instances), each.key))} /home/ec2-user/${element(var.apps, index(keys(var.instances), each.key))}
    sudo yum update -y > /tmp/remote_output.log 2>&1
    sudo yum install python3 -y >> /tmp/remote_output.log 2>&1
    sudo yum install python3-pip -y >> /tmp/remote_output.log 2>&1
    sudo pip3 install flask >> /tmp/remote_output.log 2>&1
    echo '#!/bin/bash' > /home/ec2-user/run_app.sh
    echo 'nohup sudo python3 /home/ec2-user/${element(var.apps, index(keys(var.instances), each.key))} &' >> /home/ec2-user/run_app.sh
    chmod +x /home/ec2-user/run_app.sh
    sudo /home/ec2-user/run_app.sh
    sleep 30
  EOF

}
