#!/bin/usr/env bats

# Load bats-file library only
load /opt/bats/lib/bats-assert/load.bash

@test 'assert()' {
  touch '/tmp/testfile.log'
  assert [ -e '/tmp/testfile.log' ]
}

@test 'assert_output()' {
  run echo 'want'
  assert_output 'want'
}