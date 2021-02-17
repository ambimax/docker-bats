#!/usr/bin/env bash

if (( BASH_VERSINFO[0] < 4 )); then
    echo "Bash Lib requires bash v4 or greater"
    echo "Current Bash Version: ${BASH_VERSION}"
    exit 1
fi

# Set global variables
TESTLIB_DIR=/opt/bats-core/lib/

# Load library files
source ${TESTLIB_DIR}/bats-support/load.bash
source ${TESTLIB_DIR}/bats-assert/load.bash
source ${TESTLIB_DIR}/bats-file/load.bash
