run "hello_world" {
  variables {
    command = "echo hello world"
  }

  assert {
    condition     = output.stdout == "hello world"
    error_message = "Failed to collect correct output"
  }
  assert {
    condition     = output.stderr == ""
    error_message = "Failed to collect correct error output"
  }
  assert {
    condition     = output.exit_code == 0
    error_message = "Failed to collect correct exit code"
  }
}

run "terraform_version" {
  variables {
    command = "terraform version"
  }

  assert {
    condition     = strcontains(data.external.run_command.result.command_stdout, "Terraform")
    error_message = "Failed to execute command"
  }
}
