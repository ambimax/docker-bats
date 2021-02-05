#!/bin/usr/env bats

# Load bats-file library only
load /opt/bats/lib/bats-file/load.bash

@test 'assert_file_executable' {
  assert_file_executable /opt/bats/bin/bats
}