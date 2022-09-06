#!/usr/bin/env bash

set -o errexit

SWD="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

R="$(dirname "$SWD")/jh-github-dc"

export DOCKER_STARTUP_DELAY=120

header_begin() {
    echo -n "*** $*..."
}

header_end() {
    echo "... done"
}

header_begin "start"
$R start
header_end

header_begin "make dump (legacy)"
$R make dump
header_end

header_begin "run make dump"
$R run "make dump"
header_end

header_begin "run make dc-hello"
DC_ARGS0="-e" DC_ARGS1="CUSTOM_ENV=Human" $R run "make dc-hello"
header_end

header_begin "run make dc-hello (2)"
$R run "CUSTOM_ENV_0=Human make dc-hello"
header_end

header_begin "run ls /"
$R run "ls /"
header_end

header_begin "stop"
$R stop
header_end
