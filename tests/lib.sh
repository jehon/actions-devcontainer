#!/usr/bin/env bash

SWD="$(dirname "${BASH_SOURCE[0]}")"

header_begin() {
    echo "::group::{$1}"
    echo "$1..."
}

header_end() {
    echo "...done"
    echo "::endgroup::"
}

R="$(dirname "$SWD")/jh-github-dc"

export DOCKER_STARTUP_DELAY=120
export R
