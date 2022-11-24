#!/usr/bin/env bash

SWD="$(dirname "${BASH_SOURCE[0]}")"

header_begin() {
    if [ -n "$CI" ]; then
    echo "::group::{$1}"
    fi
    echo "$1..."
}

header_end() {
    echo "...done"
    if [ -n "$CI" ]; then
    echo "::endgroup::"
    fi
}

R="$(dirname "$SWD")/jh-github-dc"

export DOCKER_STARTUP_DELAY=120
export R

# Simulate github env
export GITHUB_STEP_SUMMARY=tmp/GITHUB_STEP_SUMMARY.log
