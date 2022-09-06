#!/usr/bin/env bash

set -o errexit

SWD="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

R="$(dirname "$SWD")/jh-github-dc"

header_begin "native dump"
$R dump
header_end
