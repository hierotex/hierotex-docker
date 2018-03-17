#!/bin/bash
set -exu
ITEMS=$@
if [[ $# -eq 0 ]]; then
  ITEMS=hierotex*
fi
# Parallel build (mainly a one-off)
for i in $ITEMS; do echo docker build -f $i/Dockerfile -t $i .; done | parallel --ungroup
# Sequential test
for i in $ITEMS; do
  docker run --workdir=/test-files --rm -ti hierotex-debian-stretch ./test.sh
done;
