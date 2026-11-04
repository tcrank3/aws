variable "aws_region" {
  description = "AWS region in which to create the bucket."
  type        = string
  default     = "us-east-1"
}

variable "bucket_names" {
  description = "Globally unique names for the S3 buckets."
  type        = list(string)
}