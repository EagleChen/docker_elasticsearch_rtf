#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
    set -- elasticsearch "$@"
fi

exec "$@"
