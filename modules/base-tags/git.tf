locals {
  git_branch             = module.git_branch.stdout
  git_working_tree_state = module.git_working_tree_state.stdout == "" ? "clean" : "dirty"

  git_tags = merge(
    {
      GitWorkingPath = !var.terragrunt ? module.git_working_path.stdout : split(".terragrunt-cache", module.git_working_path.stdout)[0]
    },
    !var.avoid_frequently_changing_tags ? {
      GitBranch           = local.git_branch
      GitWorkingTreeState = local.git_working_tree_state
    } : {}
  )
}

module "git_branch" {
  source  = "../..//modules/run-cmd"
  command = "git symbolic-ref --short HEAD"
}

module "git_working_tree_state" {
  source  = "../..//modules/run-cmd"
  command = "git diff --stat"
}

module "git_working_path" {
  source  = "../..//modules/run-cmd"
  command = "git rev-parse --show-prefix"
}
