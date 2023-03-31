resource "aws_iam_user" "main" {
  name = "developer"

  tags = {
    tag-key = "my-user"
  }
}

resource "aws_iam_policy" "main-policy" {
  name = "developer"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.main.name
  policy_arn = aws_iam_policy.main-policy.arn
}