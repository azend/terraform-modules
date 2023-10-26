locals {
  tags = merge(
    {
      Terraform = true
    },
    local.terraform_tags,
    local.git_tags,
    local.cloud_provider_tags
  )
}
