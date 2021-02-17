#!/usr/bin/env bash

if ! command -v npm &> /dev/null
then
    echo "npm could not be found"
    exit 1
fi

# Config
NODE_MODULES="$(npm root --global)"

# Install bats
npm install --global bats bats-support bats-assert

# Make libs executable
chmod +x "${NODE_MODULES}/bats-support/load.bash"
chmod +x "${NODE_MODULES}/bats-assert/load.bash"

cat >> "${NODE_MODULES}/bats/lib/bats-core/test_functions.bash" <<- EOM

### Load Libraries
source ${NODE_MODULES}/bats-support/load.bash;
source ${NODE_MODULES}/bats-assert/load.bash;
EOM

cat "${NODE_MODULES}/bats/lib/bats-core/test_functions.bash"
