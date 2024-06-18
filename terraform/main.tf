# Define the provider
provider "aws" {
	region = "us-east-1"
}

# Create vpc 
resource "aws_vpc" "ewm_vpc" {
	cidr_block = "10.0.0.0/16"
}

# create subnet
resource "aws_subnet" "ewm_subent" {
	vpc_id = aws_vpc.ewm_vpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "us-east-1a"
}

# create ig 
resource "aws_internet_gateway" "ewm_igw" {
	vpc_id = aws_vpc.ewm_vpc.id
}

# Create a routing table 
resource "aws_route_table" "ewm_route_table" {
	vpc_id = aws_vpc.ewm_vpc.id

  	route {
    		cidr_block = "0.0.0.0/0"
    		gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "ewm_route_table_association" {
  	subnet_id      = aws_subnet.ewm_subnet.id
  	route_table_id = aws_route_table.ewm_.id
}

# Create a security group
resource "aws_security_group" "ewm_sg" {
  	vpc_id = aws_vpc.ewm_vpc.id

  	# Allow SSH access from anywhere
  	ingress {
    		from_port   = 22
    		to_port     = 22
    		protocol    = "tcp"
    		cidr_blocks = ["0.0.0.0/0"]
  	}

  	# Allow all traffic within the VPC
  	ingress {
    		from_port   = 0
    		to_port     = 65535
    		protocol    = "-1"
    		cidr_blocks = [aws_vpc.ewm_vpc.cidr_block]
  	}

  	egress {
    		from_port   = 0
    		to_port     = 0
    		protocol    = "-1"
    		cidr_blocks = ["0.0.0.0/0"]
  	}
}

# Output the VPC ID and Subnet ID for use in other files
output "vpc_id" {
  	value = aws_vpc.ewm_vpc.id
}

output "subnet_id" {
  	value = aws_subnet.ewm_subnet.id
}

output "security_group_id" {
  	value = aws_security_group.ewm_sg.id
}
