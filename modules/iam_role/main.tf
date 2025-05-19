resource "aws_iam_role" "thisrole" {
  name               = var.name 
  assume_role_policy = jsondecode(var.assume_role_policy) 
}

resource "aws_iam_role_policy_attachment" "thisrole" {
  role               = aws_iam_role.thisrole.name
  policy_arn         = var.policy_arn
}