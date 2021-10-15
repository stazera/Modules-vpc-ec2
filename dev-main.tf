provider "aws"{
    region = "us-east-2"
}

module "vpc" {
    source = "../modules/vpc"
    vpc_cidr    =   "10.0.0.0/24"
    tenancy     =   "default" 
    vpc_id      =   module.vpc.vpc_id
    subnet_cidr =   "10.0.0.0/28"   
}


module "my_ec2" {
    source          = "../modules/ec2"
    count           = "1"
    ami_id          = "ami-074cce78125f09d61"
    instance_type   = "t2.small"
    subnet_id       =  module.vpc.subnet_id
}