Inspired by Terragrunt `run_cmd()`, this naughty module allows you to run arbitrary commands on the local host and return the output back to Terraform for further processing.

This module should work on the nixes but won't work on Windows without a nix-like execution environment. This module also requires `jq` to be installed.
