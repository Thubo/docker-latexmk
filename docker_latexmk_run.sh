#!/bin/bash
# ./docker_latexmk_run.sh <Folder to .tex file> <command after latexmk, e.g. -xelatex file.tex>
docker run --rm -v ${PWD}:/data latex sh -c "cd /data/${1} && latexmk ${2}"
