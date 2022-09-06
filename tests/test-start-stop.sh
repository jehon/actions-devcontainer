#!/usr/bin/env bash

set -o errexit

# shellcheck source=/usr/bin/jh-lib
. jh-lib

R="$(dirname "$JH_SWD")/jh-github-dc"

export DOCKER_STARTUP_DELAY=120

header_begin "start"
$R start
header_end

header_begin "make dump"
$R make dump
header_end

header_begin "make dc-hello"
DC_ARGS0="-e" DC_ARGS1="CUSTOM_ENV=Human" $R make dc-hello
header_end

header_begin "true"
$R run "ls /"
header_end

header_begin "stop"
$R stop
header_end
