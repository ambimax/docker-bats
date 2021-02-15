#!/bin/usr/env bats

# Load all libraries
load /opt/bats/lib/helper.bash

@test "bats-assert test" {
    run echo "testing"
    assert_output -p 'stin'
}

@test 'bats-file test' {
  assert_file_executable /usr/local/bin/bats
}
