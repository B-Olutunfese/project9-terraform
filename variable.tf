  variable "pro9-vpc-cidr" {
   default = "10.0.0.0/16"
   description = "pro9 vpc cidr block"
   type = string
  }
 
  variable "pro9-pub-subnet-cidr" {
   default = "10.0.1.0/24"
   description = "pro9-pub subnet1 cidr block"
   type = string
  }

  variable "pro9-public-subnet-cidr" {
   default = "10.0.2.0/24"
   description = "pro9-pub subnet2 cidr block"
   type = string
  } 

  variable "pro9-private-sub-cidr" {
   default = "10.0.3.0/24"
   description = "pro9-private subnet1 cidr block"
   type = string
  }

  variable "proj9-private-sub-cidr" {
   default = "10.0.4.0/24"
   description = "pro9-private subnet2 cidr block"
   type = string
  }

 variable "pro9-AMI" {
   default = "ami-0fc15d50d39e4503c"
   description = "proj9-AMI"
   type = string
  }
 
 variable "pro9-region" {
   default = "eu-west-2"
   description = "proj9-region"
   type = string
  }