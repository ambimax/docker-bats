#!/bin/usr/env bats

@test "Make is installed" {
    run  make --version
    assert_output -p "GNU Make"
}

@test "Use makefile" {
    run make hello
    assert_output 'Makefile works'
}

@test "Use docker in makefile" {
    run make dockertest
    assert_output -p 'Hello from Docker!'
}

@test "Use docker-compose in makefile" {
    run make dockercomposetest
    assert_output -p 'Hello from Docker!'
}
