#!/bin/bash
# ./docker_latexmk_run.sh <Folder to .tex file> <Name of .tex file>
docker run --rm -v ${PWD}:/data latex sh -c "cd /data/${1} && latexmk -xelatex ${2}"
