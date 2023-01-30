FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
      curl \
      fontconfig \
      gnuplot \
      libfontconfig1 \
      perl \
      wget \
      ghostscript \
      && rm -rf /var/lib/apt/lists/*

ADD texlive.profile.2021 /tmp/texlive.profile

RUN mkdir -p /tmp/install-tl-unx \
    && curl -SL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar --strip-components=1 -xzC /tmp/install-tl-unx \
    && /tmp/install-tl-unx/install-tl --profile=/tmp/texlive.profile \
    && rm -rf /tmp/texlive* /tmp/install-tl*

RUN groupadd -g 1000 latex && useradd -u 1000 -g latex latex
USER latex

ADD latexmkrc /home/latex/.latexmkrc

WORKDIR /data
ENTRYPOINT ["latexmk"]
CMD ["-help"]
