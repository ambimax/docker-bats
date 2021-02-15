#!/bin/usr/env bats

# Load all libraries
load /opt/bats/lib/helper.bash

@test 'assert_file_executable' {
  assert_file_executable /usr/local/bin/bats
}
