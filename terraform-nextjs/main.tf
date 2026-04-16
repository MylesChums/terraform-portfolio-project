provider "aws" {
    region = "us-east-1"
  
}

# S3 Bucket
resource "aws_s3-bucket" "nextjs_bucket" {
    bucket = "nextjs-portfolio-bucket-mc"
  
}

# Ownership Control 
resource "aws_s3_bucket_ownership_controls" "nextjs_bucket_ownership_controls" {
    bucket = aws_s3_bucket.nextjs_bucket.id 

    rule {
      object_ownership = "BucketOwnerPrefferred"
    }
  
}
# Block Public Access
resource "aws_s3_bucket_pubic_access_block" "nextjs_bucket_public_access_block" {
    bucket = aws_s3_bucket.nextjs._bucket.id
    
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

# Bucket ACL
resource "aws_s3_bucket_acl" "nextjs_bucket_acl" {

    depends_on = [
        aws_s3-bucket.ownership_controls.nextjs,
        awsaws_s3_bucket_pubic_access_block.nextjs_bucket_public_access_block
     ]
     bucket = aws_s3_bucket.nextjs_bucket.id
     acl = "public-read"

}