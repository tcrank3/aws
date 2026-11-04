moved {
  from = aws_s3_bucket.this
  to   = module.s3.aws_s3_bucket.this
}

moved {
  from = aws_s3_bucket_public_access_block.this
  to   = module.s3.aws_s3_bucket_public_access_block.this
}

moved {
  from = aws_s3_bucket_server_side_encryption_configuration.this
  to   = module.s3.aws_s3_bucket_server_side_encryption_configuration.this
}