#!/bin/bash
docker build --no-cache -t thubo/latexmk:medium .

docker push thubo/latexmk:medium
