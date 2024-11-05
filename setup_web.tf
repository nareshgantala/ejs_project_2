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

resource "null_resource" "docker_setup" {
  provisioner "local-exec" {
    command = <<-EOF
      docker build -t my-node-app-4 .
      docker run -d -p 3000:3000 my-node-app-4
    EOF
  }

  # Ensure the provisioner runs after the instance data is fetched
  depends_on = [data.aws_instances.existing_instance]
}
