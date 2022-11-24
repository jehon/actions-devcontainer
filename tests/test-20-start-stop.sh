#!/usr/bin/env bash

set -o errexit

. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

BUILD_DIR="$( realpath "$SWD" )"
export BUILD_DIR

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
