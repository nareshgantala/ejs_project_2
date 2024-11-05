provider "aws" {
  region = "us-east-1"
}

data "aws_instances" "existing_instance" {
  filter {
    name   = "tag:Name"
    values = ["minikube"]  # Replace with your EC2 instance Name tag
  }
}

output "instance_public_ip" {
  value = data.aws_instances.existing_instance.public_ips[0]
}

resource "null_resource" "ansible_playbook" {
  provisioner "local-exec" {
    command = <<-EOF
      sshpass -p "your_password" ssh -o StrictHostKeyChecking=no centos@${data.aws_instances.existing_instance.public_ips[0]} << 'EOSSH'
        cd /home/centos/ejs_project_2
        docker build -t my-node-app .
        docker run -d -p 3000:3000 my-node-app
      EOSSH
    EOF
  }

  depends_on = [data.aws_instances.existing_instance]
}
