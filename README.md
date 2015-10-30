# Docker LaTeX

* Based on Debian Jessie
* Latest LaTeX installed via the online texlive installer
* Runs LaTeXMK to compile the documents

# Building the Image
Run the `docker_build.sh` script or

```
docker build -t latexmk .
```

# Usage
The working directory inside the container is `/data`.
The default command is `latexmk -outdir=build`.

For example, you have a folder containing your `master.tex` file and you perform

```
docker run --name $(basename $PWD) --rm -v ${PWD}:/data latexmk master.tex

```

What basically happens inside the container is

```
cd /data
latexmk -outdir=build master.tex
```

To add additional parameters simply run

```
docker run --name $(basename $PWD) --rm -v ${PWD}:/data latexmk -xelatex -silent -time -jobname=title -pvc -view=none master.tex
```

What happens is equivalent to

```
cd /data
latexmk -outdir=build -xelatex -silent -time -jobname=title -pvc -view=none master.tex
```

**Note** You can always **Ctrl+c** the `pvc` mode to exit.

For details on `latexmk` see
```
docker run --name $(basename $PWD) --rm -v ${PWD}:/data latexmk -help
```

or ftp://ftp.rrzn.uni-hannover.de/pub/mirror/tex-archive/support/latexmk/latexmk.pdf

# SELinux

If you are using a host with SELinux enabled, you might need to mount the `/data` directory into your container with the `:Z` option, e.g.

```
docker run [...] -v ${PWD}:/data:Z [...]
```
