module "iam_policy" {
    source         = "../../modules/iam_policy"
    name           = var.name
    description    = "Policy for assuming role in dev"

    policy_statements = [
        {
            Effect   = "Allow"
            action   = ["s3:ListBucket"]
            Resource = ["arn:aws:s3:::example-bucket-dev"]
        },
        {
        Effect   = "Allow"
        action   = ["s3:GetObject"]
        resource = ["arn:aws:s3:::example-bucket-dev/*"]
        }
    ]
}

module "iam_role" {
  source            = "../../modules/iam_role"
  name              = var.name
  assume_role_policy = {
    Version = "2012-10-17"
    statement = [
        {
          Effect = "Allow"
          principal = {
            service = "ec2.amazonaws.com"
          }
          action = "sts:assumerole"
        }
    ]
  }
  policy_arn      = module.iam_policy
}