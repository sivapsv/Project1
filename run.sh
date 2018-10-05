#!/bin/bash

prog=$0

function usage {
    echo "usage: $prog serve|build|buildpdf"
    echo "  serve      serve html pages on port 8000"
    echo "  build      build pages from /data/md to /data/md/site"
    echo "  buildpdf   build pdf from /data/md to /data/md/site/index.pdf"
    exit 1
}

function serve() {
    mkdocs serve -a $(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1):8000
}

function build() {
    mkdocs build
}

function buildpdf() {
    echo "buildpdf TODO"
}

if [ $# -ne 1 ]; then
    usage
fi

cd /data

case $1 in
     serve)
          serve
          ;;
     build)
          build
          ;;
     buildpdf)
          buildpdf
          ;; 
     *)
          usage
          ;;
esac
