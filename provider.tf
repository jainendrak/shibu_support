terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
  access_key = "AKIAZVU2FHTHRVT4EV74"
  secret_key = "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"
}