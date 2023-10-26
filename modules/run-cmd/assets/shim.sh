#!/bin/bash

STDIN=$(cat)

COMMAND=$(jq -r '.command' <<< "${STDIN}")

STDOUT=$(mktemp)
STDERR=$(mktemp)

$COMMAND > $STDOUT 2> $STDERR

EXIT_CODE=$?

jq -n '$ARGS.named'  \
  --arg "command" "${COMMAND}" \
  --arg command_stdout "$(cat $STDOUT)" \
  --arg command_stderr "$(cat $STDERR)" \
  --arg exit_code "${EXIT_CODE}"

rm $STDOUT
rm $STDERR
