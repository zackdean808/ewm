# Define the provider
provider "aws" {
	region = "us-east-1"
}

# Create vpc 
resource "aws_vpc" "my_ewm_vpc" {
	cidr_block = "10.0.0.0/16"
}

# create subnet
resource "aws_subnet" "my_ewm_subent" {
	vpc_id = aws_vpc.my_ewm_vpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "us-east-1a"
}

# create ig 
resouce "aws_internet_gateway" "my_ewm_igw" {
	vpc_id = aws_vpc.my_ewm_vpc.id
}

# Create a routing table 
resource "aws_route_table" "ewm_route_table" {
	vpc_id = aws_vpc.my_ewm_vpc.id

  	route {
    		cidr_block = "0.0.0.0/0"
    		gateway_id = aws_internet_gateway.my_igw.id
  }
}


