provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

# Reference the shared resources
data "terraform_remote_state" "shared" {
  backend = "local"

  config = {
    path = "../shared/terraform.tfstate"
  }
}

# Create the first EC2 instance
resource "aws_instance" "ansible_server" {
  ami             = "ami-08a0d1e16fc3f61ea"  # Change to your preferred AMI
  instance_type   = "t2.micro"
  subnet_id       = data.terraform_remote_state.shared.outputs.subnet_id
  security_groups = [data.terraform_remote_state.shared.outputs.security_group_id]
  key_name	  = "ewm-key-pair"
  associate_public_ip_address = true  # Enable public IP assignment

  tags = {
    Name = "ansible_server"
  }
}
