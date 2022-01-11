#!/bin/bash
docker build --no-cache -t thubo/latexmk:full .
docker tag thubo/latexmk:full thubo/latexmk:latest
