terraform {
  backend "S3" {
    bucket = "mc-my-terraform-state"
    key = "global/s3/terraform.tfstate"
    region = "eu-east-1"
    dynamodb_table = "terraform-lock-file"
    
  }
}