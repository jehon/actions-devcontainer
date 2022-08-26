#!/usr/bin/env bash

set -o errexit

# shellcheck source=/usr/bin/jh-lib
. jh-lib

R="$(dirname "$JH_SWD")/jh-github-dc"

header_begin "native dump"
$R dump
header_end
