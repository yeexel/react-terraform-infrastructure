resource "aws_s3_bucket" "site" {
  bucket        = "${var.s3_bucket_name}"
  acl           = "public-read"
  force_destroy = true

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.s3_bucket_name}/*"]
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = "${local.common_tags}"
}
