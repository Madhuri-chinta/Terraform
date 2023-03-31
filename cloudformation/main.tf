resource "aws_cloudformation_stack" "bucket" {
  name = "bucket-stack"
  template_body = jsonencode({
    "Resources" : {
      "S3Bucket" : {
        "Type" : "AWS::S3::Bucket",
        "Properties" : {
          "BucketName" : "sweetymadhurineelum"

        }
      }
    }
    }
  )
}