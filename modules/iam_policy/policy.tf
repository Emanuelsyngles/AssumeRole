resource "aws_iam_policy" "this" {
  name         = var.name 
  description  = var.description

  policy = jsondecode({
    Version = "2012-10-17"
    Statement = var.statements
  })
}