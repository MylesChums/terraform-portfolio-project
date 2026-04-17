terraform {
  backend "s3" {
    bucket = "nextjs-portfolio-bucket-mc"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    
  }
}