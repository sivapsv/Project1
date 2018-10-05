#!/bin/bash

# mkdocs: build and serve markdown help files.
# Run without arguments to see usage.

docker run -u`id -u $USER`:`id -g $USER` -p8000:8000 -v`pwd`:/data docker.artifactory.rosetta.ericssondevops.com/docker-sanskrit/mkdocs $1
