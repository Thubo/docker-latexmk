# FROM ubuntu:14.04.2
FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install \
   wget \
   sudo \
   apt-utils \
   perl \
   vim \
   git \
   make \
   libfontconfig1
ADD texlive.profile /tmp/texlive.profile
RUN \
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -q -O- | tar -xz -C /tmp && \
  cd /tmp/install-tl* && \
  ./install-tl \
    --location http://ctan.sciserv.eu/systems/texlive/tlnet \
    --profile=/tmp/texlive.profile && \
  rm -rf /tmp/texlive* /tmp/install-tl*

