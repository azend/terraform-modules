locals {
  terraform_version = split(" ", split("\n", module.terraform_version.stdout)[0])[1]

  terraform_tags = merge(
    {
      TerraformVersion = local.terraform_version
    },
    var.terragrunt ? {
      TerragruntVersion = reverse(split(" ", module.terragrunt_version[0].stdout))[0]

    } : {}
  )
}

module "terraform_version" {
  source  = "../..//modules/run-cmd"
  command = "terraform version"
}

module "terragrunt_version" {
  count   = var.terragrunt ? 1 : 0
  source  = "../..//modules/run-cmd"
  command = "terragrunt --version"
}
