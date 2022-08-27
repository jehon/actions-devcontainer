#!/usr/bin/env bash

YES="yes"
NO=""

: "${YES:=failed}"
: "${NO:=no}"

echo "YES: $YES"
echo "NO: $NO"

test "$YES" = "yes"
test "$NO" = "no"

echo "ok"
