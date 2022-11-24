#!/usr/bin/env bash

set -o errexit

. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

export DOCKER_CONTEXT="$SWD"

header_begin "start"
$R stop || true
$R start
header_end

header_begin "run make dc-hello (inline env)"
$R run "CUSTOM_ENV=Human make dc-hello"
header_end

header_begin "run ls /"
$R run "ls /"
header_end

header_begin "stop"
$R stop
header_end

echo "test-start-stop: ok"
