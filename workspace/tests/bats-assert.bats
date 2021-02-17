#!/bin/usr/env bats

@test 'assert()' {
  touch '/tmp/testfile.log'
  assert [ -e '/tmp/testfile.log' ]
}

@test 'assert_output()' {
  run echo 'want'
  assert_output 'want'
}
