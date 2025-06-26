terraform {
  backend "s3" {
    bucket         = "vamshi-terraform-backend1"      # ← your bucket
    key            = "gitops/terraform.tfstate"       # ← a folder/key inside the bucket
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"                # ← optional, for locking
    encrypt        = true
  }
}
