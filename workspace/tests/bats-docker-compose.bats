#!/bin/usr/env bats

# Load all libraries
load /opt/bats/lib/helper.bash

@test "docker-compose is installed" {
    run docker-compose --version
    assert_output -p "docker-compose version"
}

@test "Use docker-compose" {
    run docker-compose up
    assert_output -p 'Hello from Docker!'
}
