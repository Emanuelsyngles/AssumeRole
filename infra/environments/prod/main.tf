module "iam_policy" {
    source         = "../../modules/iam_policy"
    name           = var.name
    description    = "Policy for assuming role in prod"

    policy_statements = [
        {
            Effect   = "Allow"
            Action   = ["s3:ListBucket"]
            Resource = ["arn:aws:s3:::example-bucket-prod"]
        },
        {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:PutObject"]
        Resource = ["arn:aws:s3:::example-bucket-prod/*"]
        }
    ]
}

module "iam_role" {
  source            = "../../modules/iam_role"
  name              = var.name
  assume_role_policy = {
    Version = "2012-10-17"
    Statement = [
        {
          Effect = "Allow"
          Principal = {
          Service = "ec2.amazonaws.com"
          }
          action = "sts:AssumeRole"
        }
    ]
  }
  policy_arn      = module.iam_policy.arn

  tags = {
    Environment = "prod"
    ManagedBy   = "Terraform"
  }
}