terraform {
   backend "s3" {
     bucket = "udacity-tf-anjanil"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

 provider "aws" {
   region = "us-east-2"
   #profile = "default"
   
   default_tags {
     tags = local.tags
   }
 }