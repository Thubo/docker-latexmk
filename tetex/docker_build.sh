#!/bin/bash
docker build --no-cache -t thubo/latexmk:tetex .

docker push thubo/latexmk:tetex
