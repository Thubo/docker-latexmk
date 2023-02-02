#!/bin/bash
docker build --no-cache -t thubo/latexmk:full .
docker tag thubo/latexmk:full thubo/latexmk:latest

docker push thubo/latexmk:full
docker push thubo/latexmk:latest
