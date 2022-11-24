#!/usr/bin/env bash

set -o errexit

. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

export DOCKER_CONTEXT="$SWD"

header_begin "start"
$R stop || true
$R start
header_end

header_begin "inside true (simple command)"
$R run "true"
header_end

header_begin "inside 'false || true' (complex command)"
$R run "false || true"
header_end

header_begin "stop"
$R stop
header_end

echo "test-start-stop: ok"
