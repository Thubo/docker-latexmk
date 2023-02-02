#!/bin/bash
docker build --no-cache -t thubo/latexmk:small .

docker push thubo/latexmk:small
