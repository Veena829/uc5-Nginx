package terraform.security

# Prevent public access to S3 buckets
deny[msg] {
  some r in input.resource_changes
  r.type == "aws_s3_bucket"
  r.change.after.acl == "public-read"
  msg := "S3 bucket is publicly accessible!"
}

# Ensure EC2 instance has an instance_type specified
deny[msg] {
  some r in input.resource_changes
  r.type == "aws_instance"
  not r.change.after.instance_type
  msg := "EC2 instance does not have an instance_type defined!"
}
