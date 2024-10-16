# Dit maakt de s3 bucket aan waar de cloudformation bestanden naartoe moeten.
resource "aws_s3_bucket" "cloudshirt" {
  bucket = "cloudshirt"

  tags = {
    Name        = "cloudshirt"
  }
}

# Dit maakt een data object aan waaran verwezen kan worden. Deze objecten wijzen naar de github .yaml bestanden.
data "github_repository_file" "awsBasicsNetwerk" {
  repository          = "PinkBowser/cloudAutomationConceptsGroep"
  branch              = "main"
  file                = "awsBasics/awsBasicsNetwerk.yaml"
}

data "github_repository_file" "awsBasicsRDS" {
  repository          = "PinkBowser/cloudAutomationConceptsGroep"
  branch              = "main"
  file                = "awsBasics/awsBasicsRDS.yaml"
}

data "github_repository_file" "awsBasicsAutoScalingGroup" {
  repository          = "PinkBowser/cloudAutomationConceptsGroep"
  branch              = "main"
  file                = "awsBasics/awsBasicsAutoScalingGroup.yaml"
}

# Dit maakt schijft de cloudformation templates van de github naar de eerder aangemaakte s3 bucket.
resource "aws_s3_object" "awsBasicsNetwerk" {
  depends_on = [data.github_repository_file.awsBasicsNetwerk]
  bucket = aws_s3_bucket.cloudshirt.id
  key    = "awsBasicsNetwerk"
  content = data.github_repository_file.awsBasicsNetwerk.content
}

resource "aws_s3_object" "awsBasicsRDS" {
  depends_on = [data.github_repository_file.awsBasicsRDS]
  bucket = aws_s3_bucket.cloudshirt.id
  key    = "awsBasicsRDS"
  content = data.github_repository_file.awsBasicsRDS.content
}

resource "aws_s3_object" "awsBasicsAutoScalingGroup" {
  depends_on = [data.github_repository_file.awsBasicsAutoScalingGroup]
  bucket = aws_s3_bucket.cloudshirt.id
  key    = "awsBasicsAutoScalingGroup"
  content = data.github_repository_file.awsBasicsAutoScalingGroup.content
}

# Dit maakt de stacks aan. Dit gaat op volgorde en de bestanden worden uit S3 gehaald.
resource "aws_cloudformation_stack" "awsBasicsNetwerk" {
  depends_on = [aws_s3_object.awsBasicsNetwerk]
  name = "CloudShirt"
  template_url = "https://cloudshirt.s3.amazonaws.com/awsBasicsNetwerk"
}

resource "aws_cloudformation_stack" "awsBasicsRDS" {
  depends_on = [aws_cloudformation_stack.awsBasicsNetwerk]
  name = "CloudShirtDB"
  template_url = "https://cloudshirt.s3.amazonaws.com/awsBasicsRDS"
}

resource "aws_cloudformation_stack" "awsBasicsAutoScalingGroup" {
  depends_on = [aws_cloudformation_stack.awsBasicsRDS]
  name = "CloudShirtASG"
  template_url = "https://cloudshirt.s3.amazonaws.com/awsBasicsAutoScalingGroup"
}
