#!/bin/usr/env bats

@test "Docker is installed" {
    run docker --version
    assert_output -p "Docker version"
}

@test "Use docker in makefile" {
    run docker run hello-world
    assert_output -p 'Hello from Docker!'
}
