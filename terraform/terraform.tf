resource "aws_s3_bucket" "cloudshirt" {
  bucket = "cloudshirt"

  tags = {
    Name        = "cloudshirt"
  }
}

resource "aws_s3_object" "cloudshirt" {
  depends_on = [data.github_repository_file.cloudshirt]
  bucket = aws_s3_bucket.cloudshirt.id
  key    = "awsBasicsNetwerk"
  content = data.github_repository_file.cloudshirt.content
}

data "github_repository_file" "cloudshirt" {
  repository          = "PinkBowser/cloudAutomationConceptsGroep"
  branch              = "main"
  file                = "awsBasics/awsBasicsNetwerk.yaml"
}

resource "aws_cloudformation_stack" "cloudshirt" {
  depends_on = [aws_s3_bucket.cloudshirt]
  name = "CloudShirt"
  template_url = "https://cloudshirt.s3.amazonaws.com/awsBasicsNetwerk"
}
# s3://cloudshirt/awsBasicsNetwerk
# https://cloudshirt.s3.amazonaws.com/awsBasicsNetwerk