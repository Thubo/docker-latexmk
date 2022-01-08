FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update && \
#   apt-get -y install \
#    apt-utils \
#    curl \
#    fontconfig \
#    git \
#    gnuplot \
#    libfontconfig1 \
#    make \
#    perl \
#    sudo \
#    vim \
#    wget

RUN apt-get update && apt-get -y install \
      curl \
      perl \
      wget \
      && rm -rf /var/lib/apt/lists/*

ADD texlive.profile.2021 /tmp/texlive.profile

RUN mkdir -p /tmp/install-tl-unx \
    && curl -SL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar --strip-components=1 -xzC /tmp/install-tl-unx \
    && /tmp/install-tl-unx/install-tl --profile=/tmp/texlive.profile \
    && rm -rf /tmp/texlive* /tmp/install-tl*

