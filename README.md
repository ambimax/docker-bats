# ambimax/docker-bats

Docker image for bats testing

- local testing
- CI/CD testing like Github Actions

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

## Libraries

The following libraries are included

- [bats-assert](https://github.com/bats-core/bats-assert)
- [bats-file](https://github.com/bats-core/bats-file)

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

## Tutorials

- [Testing with bash bats, 02/1919](https://opensource.com/article/19/2/testing-bash-bats)

## Authors

- [Tobias Schifftner](https://www.twitter.com/tschifftner), [Ambimax GmbH](https://www.ambimax.de)
