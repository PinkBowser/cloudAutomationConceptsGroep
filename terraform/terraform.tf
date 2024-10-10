# resource "aws_s3_bucket" "CloudShirt" {
#   bucket = "CloudShirt"

#   tags = {
#     Name        = "CloudShirt"
 
#   }
# }

# resource "aws_s3_bucket_object" "upload_files" {
#   for_each = fileset("${path.module}/files", "**")

#   bucket = aws_s3_bucket.example_bucket.bucket
#   key    = each.value
#   source = "${path.module}/files/${each.value}"
#   acl    = "private"
# }

resource "aws_cloudformation_stack" "CloudShirt" {
  name = "CloudShirt"
  template_body = "${path.module}/awsBasics/awsBasicsNetwerk.yaml"
}