locals {
  cloud_provider_tags = merge(
    try(module.aws[0].tags, {}),
  )
}

module "aws" {
  count  = contains(var.cloud_providers, "aws") ? 1 : 0
  source = "../..//modules/base-tags/cloud-providers/aws"
}

# @TODO: Implement additional cloud providers
#
# module "gcp" {
#   count  = contains(var.cloud_providers, "gcp") ? 1 : 0
#   source = "./cloud-providers/gcp/"
# }
# 
# module "azure" {
#   count  = contains(var.cloud_providers, "azure") ? 1 : 0
#   source = "./cloud-providers/azure/"
# }
