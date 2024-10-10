resource "aws_s3_bucket" "cloudshirt" {
  bucket = "cloudshirt"

  tags = {
    Name        = "cloudshirt"
  }
}

resource "aws_s3_object" "cloudshirt" {
  bucket = aws_s3_bucket.cloudshirt.id
  key    = "awsBasicsNetwerk.yaml"
  source = data.github_repository_file.cloudshirt.content
  # source = "${path.module}/bestanden/awsBasicsNetwerk.yaml"
}

data "github_repository_file" "cloudshirt" {
  repository          = "PinkBowser/cloudAutomationConceptsGroep"
  branch              = "main"
  file                = "awsBasics/awsBasicsNetwerk.yaml"
}

# resource "aws_cloudformation_stack" "CloudShirt" {
#   name = "CloudShirt"
#   template_body = file("C:\\Users\\Lucas\\Documents\\GitHub\\cloudAutomationConceptsGroep\\awsBasics\\awsBasicsNetwerk.yaml")
# }