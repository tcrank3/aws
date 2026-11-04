output "bucket_names" {
  description = "Names of the created S3 buckets."
  value       = module.s3.bucket_names
}