terraform {
  backend "s3" {
    bucket = "terraform-s3-bucket-flask-container"
    key = "global/s3/terraform.tfstate"
    region = "ap-south-1"
  }
}