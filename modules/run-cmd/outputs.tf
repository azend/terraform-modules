output "stdout" {
  value = data.external.run_command.result.command_stdout
}

output "stderr" {
  value = data.external.run_command.result.command_stderr
}

output "exit_code" {
  value = tonumber(data.external.run_command.result.exit_code)
}
