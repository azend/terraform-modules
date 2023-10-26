locals {
  tags = {
    LastModifiedBy = data.aws_caller_identity.current.arn
  }
}

data "aws_caller_identity" "current" {}

output "tags" {
  value = local.tags
}
