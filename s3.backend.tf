terraform {
  backend "s3" {
    bucket = "terraform-newgit-bency.site"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
