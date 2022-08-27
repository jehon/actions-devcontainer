#!/usr/bin/env bash

set -o errexit

# shellcheck source=/usr/bin/jh-lib
. jh-lib

R="$(dirname "$JH_SWD")/jh-github-dc"

header_begin "start"
$R start
header_end

header_begin "make dump"
$R make dump
header_end

header_begin "stop"
$R stop
header_end
