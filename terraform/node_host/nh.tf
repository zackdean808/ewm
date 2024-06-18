provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

# Reference the shared resources
data "terraform_remote_state" "shared" {
  backend = "local"

  config = {
    path = "./terraform.tfstate"
  }
}

# Create the second EC2 instance
resource "aws_instance" "node_host" {
  ami             = "ami-0c55b159cbfafe1f0"  # Change to your preferred AMI
  instance_type   = "t2.micro"
  subnet_id       = data.terraform_remote_state.shared.outputs.subnet_id
  security_groups = [data.terraform_remote_state.shared.outputs.security_group_id]
  key_pair	  = "ewm-key-pair"

  tags = {
    Name = "node_host"
  }
}

