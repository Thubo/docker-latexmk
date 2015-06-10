#!/bin/bash
# ./docker_cleanup_run.sh <Folder to .tex file>
docker run --rm -v ${PWD}:/data latex sh -c "cd /data/${1} && latexmk -c"
