#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
    set -- elasticsearch "$@"
fi

if [ "$1" = 'elasticsearch' ]; then
    # make sure the elasticserach directory and sub-directories after 'volume mount' are correct
    chown -R es:es /usr/share/elasticsearch
    exec gosu es "$@"
fi

exec "$@"
