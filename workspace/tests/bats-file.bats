#!/bin/usr/env bats

@test 'assert_file_executable' {
  assert_file_executable /usr/local/bin/bats
}
