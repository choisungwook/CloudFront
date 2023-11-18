provider "aws" {
  region        = "ap-northeast-2"
  default_tags {
    tags = {
      Name        = "terraform-cloudfront-test"
      Environment = "dev"
    }
  }
}
