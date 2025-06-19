terraform {
  backend "s3" {
    bucket         = "your-tf-state-bucket"
    key            = "gitops/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
