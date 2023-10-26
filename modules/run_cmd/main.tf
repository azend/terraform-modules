data "external" "run_command" {
  program = ["${path.module}/assets/shim.sh"]

  query = {
    command = var.command
  }
}
