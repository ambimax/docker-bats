#!/bin/usr/env bats

# Load all libraries
load /opt/bats/lib/helper.bash

@test "Docker is installed" {
    run docker --version
    assert_output -p "Docker version"
}

@test "Use docker in makefile" {
    run docker run hello-world
    assert_output -p 'Hello from Docker!'
}
