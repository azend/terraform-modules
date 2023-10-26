variable "cloud_providers" {
  type = list(string)
}

variable "terragrunt" {
  description = "Is this a Terragrunt project?"
  type        = bool
  default     = false
}

variable "avoid_frequently_changing_tags" {
  type    = bool
  default = false
}
