# Docker LaTeX

* Based on Debian Jessie
* Latest LaTeX installed via the online texlive installer

# Example scripts

## `docker_latexmk_run.sh`

Usage:

```
./docker_latexmk_run.sh relative/path/to/folder "-xelatex file.tex"
```

## `docker_cleanup_run.sh`

Usage:

```
./docker_cleanup_run.sh relative/path/to/folder
```

# Running the container manually

## One time mode
Build the pdf once...

```
docker run \
  --rm \
  --name latex \
  -v ${PWD}:/data \
  latex \
  sh -c "cd /data && latexmk file.tex"
```

## Continuous time mode
Build the pdf everytime a related file gets changed or updated...

```
docker run \
  --rm \
  --name latex \
  -v ${PWD}:/data \
  latex \
  sh -c "cd /data && latexmk -pvc -view=none file.tex"
```

## Simple Cleanup
Cleanup temporary files...

```
docker run \
  --rm \
  --name latex \
  -v ${PWD}:/data \
  latex \
  sh -c "cd /data && latexmk file.tex -c"
```

## Full Cleanup
Cleanup all reproducable files (including the pdf)...

```
docker run \
  --rm \
  --name latex \
  -v ${PWD}:/data \
  latex \
  sh -c "cd /data && latexmk file.tex -CA"
```

