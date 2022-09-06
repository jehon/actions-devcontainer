#!/usr/bin/env bash

set -o errexit

R="$(dirname "$JH_SWD")/jh-github-dc"

export DOCKER_STARTUP_DELAY=120

header_begin() {
    echo -n "$*..."
}

header_end() {
    echo "... done"
}

header_begin "start"
$R start
header_end

header_begin "make dump"
$R make dump
header_end

header_begin "make dc-hello"
DC_ARGS0="-e" DC_ARGS1="CUSTOM_ENV=Human" $R run "make dc-hello"
header_end

header_begin "make dc-hello (2)"
$R run "CUSTOM_ENV=Human make dc-hello"
header_end

header_begin "true"
$R run "ls /"
header_end

header_begin "stop"
$R stop
header_end
