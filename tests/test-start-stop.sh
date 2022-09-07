#!/usr/bin/env bash

set -o errexit

. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

header_begin "start"
$R stop || true
$R start
header_end

header_begin "run make dump"
$R run "make dump"
header_end

header_begin "run make dc-hello (inline env)"
$R run "CUSTOM_ENV=Human make dc-hello"
header_end

header_begin "make dump (legacy)"
$R make dump
header_end

header_begin "run make dc-hello (DC_ENV_0 - legacy)"
(
    export DC_ENV_0="CUSTOM_ENV=Human"
    $R dump
    $R run "env"
    $R run "make dc-hello"
)
header_end

header_begin "run make dc-hello (DC_ARGS - legacy)"
(
    export DC_ARG_0="-e"
    export DC_ARG_1="CUSTOM_ENV=Human"
    $R dump
    $R run "env"
    $R run "make dc-hello"
)
header_end

header_begin "run ls /"
$R run "ls /"
header_end

header_begin "stop"
$R stop
header_end

echo "test-start-stop: ok"
