#!/bin/bash
docker build --no-cache -t thubo/latexmk:basic .

docker push thubo/latexmk:basic
