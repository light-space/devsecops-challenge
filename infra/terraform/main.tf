resource "aws_security_group" "postgres_sg" {
  name        = "postgres-sg"
  description = "Postgres security group"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_user" "ci_user" {
  name = "github-actions-ci"
}

resource "aws_iam_access_key" "ci_key" {
  user = aws_iam_user.ci_user.name
}

resource "aws_iam_user_policy" "ci_policy" {
  name = "ci-admin"
  user = aws_iam_user.ci_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "*"
      Resource = "*"
    }]
  })
}

output "ci_access_key_id" {
  value = aws_iam_access_key.ci_key.id
}

output "ci_secret_access_key" {
  value     = aws_iam_access_key.ci_key.secret
  sensitive = false
}
