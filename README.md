# Docker LaTeX

* Based on Debian Jessie
* Latest LaTeX installed via the online texlive installer
* Runs LaTeXMK to compile the documents

# TL;DR
```
# docker run --name $(basename "${PWD}") --rm -v "${PWD}":/data thubo/latexmk -pdf -gg -pvc -view=none input.tex
```

Available schemes are
* basic
* small
* medium
* tetex
* full (aka latest)

# Usage
```
# docker run --rm thubo/latexmk
```
should print the help of `latexmk`

The working directory inside the container is `/data`.

To compile a document, assuming you have a folder containing your `master.tex` file,  perform
```
# docker run --name $(basename "${PWD}") --rm -v "${PWD}":/data thubo/latexmk master.tex
```
What basically happens inside the container is
```
# cd /data
# latexmk master.tex
```
To add additional parameters simply run
```
# docker run --name $(basename "${PWD}") --rm -v "${PWD}":/data thubo/latexmk -outdir=build -xelatex -silent -time -jobname=title -pvc -view=none master.tex
```
What happens is equivalent to
```
# cd /data
# latexmk -outdir=build -xelatex -silent -time -jobname=title -pvc -view=none master.tex
```

**Note** You can always **Ctrl+c** the `pvc` mode to exit.

For details on `latexmk` see
```
# docker run --rm thubo/latexmk
```
or https://www.ctan.org/pkg/latexmk/

# SELinux

If you are using a host with SELinux enabled, you might need to mount the `/data` directory into your container with the `:Z` option, e.g.
```
# docker run [...] -v "${PWD}":/data:Z [...]
```

# Building the Image

```
# docker buildx bake --push
```
