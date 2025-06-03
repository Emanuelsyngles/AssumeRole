module "iam_policy" {
    source         = "../../modules/iam_policy"
    name           = var.name
    description    = "Policy for assuming role in dev"

    policy_statements = [
        {
            Effect   = "Allow"
            Action   = ["s3:ListBucket"]
            Resource = ["arn:aws:s3:::example-bucket-dev"]
        },
        {
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = ["arn:aws:s3:::example-bucket-dev/*"]
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
          Action = "sts:AssumeRole"
        }
    ]
  }
  policy_arn      = module.iam_policy.arn

  tags = {
    Environment = "dev"
    ManagedBy    = "Terraform"
  }
}