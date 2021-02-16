# ambimax/docker-bats

[Docker image](https://hub.docker.com/r/ambimax/bats) for bats testing with batteries included

-   local testing
-   CI/CD testing like Github Actions
-   Support for Makefile, docker, docker-compose within bats tests
-   Includes bats-assert and bats-file libraries

See [workspace/](workspace/) for examples!

## Usage

Run all tests within tests folder:

```
docker run --rm --volume "${PWD}:/workspace" ambimax/bats -r workspace/tests/
```

Run single test within tests folder:

```
docker run --rm --volume "${PWD}:/workspace" ambimax/bats workspace/tests/test.bats
```

Get bats options

```
docker run --rm --volume "${PWD}:/workspace" ambimax/bats -h
```

Use docker in tests (when using a tests/ folder in current directory)

```
docker run --rm \
    --tty \
    --entrypoint bash \
    --volume "${PWD}:/workspace" \
    --volume "/var/run/docker.sock:/var/run/docker.sock" \
    "ambimax/bats:1.2.2" bats -r /workspace/tests/
```

## Libraries

The following libraries are included

-   [bats-assert](https://github.com/bats-core/bats-assert)
-   [bats-file](https://github.com/bats-core/bats-file)

### Load all libraries

To use all libraries, load lib helper at the beginning of your test file.

```
#!/bin/usr/env bats

load /opt/bats/lib/helper.bash

@test "Build image" {
    run echo "test"
    assert_output 'test'
}
```

### bats-assert

bats-assert is a helper library providing common assertions for Bats.

```
#!/bin/usr/env bats

# Load bats-assert library only
load /opt/bats/lib/bats-support/load.bash

@test 'assert()' {
  touch '/tmp/testfile.log'
  assert [ -e '/tmp/testfile.log' ]
}

@test 'assert_output()' {
  run echo 'want'
  assert_output 'want'
}
```

### bats-file

bats-file is a helper library providing common filesystem related assertions and helpers for Bats.

```
#!/bin/usr/env bats

# Load bats-file library only
load /opt/bats/lib/bats-file/load.bash

@test 'assert_file_executable' {
  assert_file_executable /path/to/executable-file
}
```

See [workspace/](workspace/) for more examples!

## Tutorials

-   [Testing with bash bats, 02/1919](https://opensource.com/article/19/2/testing-bash-bats)

## Authors

-   [Tobias Schifftner](https://www.twitter.com/tschifftner), [Ambimax GmbH](https://www.ambimax.de)
