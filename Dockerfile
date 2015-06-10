# FROM ubuntu:14.04.2
FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get -y install \
   apt-utils \
   curl \
   fontconfig \
   git \
   gnuplot \
   libfontconfig1 \
   make \
   perl \
   sudo \
   vim \
   wget

ADD texlive.profile /tmp/texlive.profile

# For the ./install-tl command you can specify the option --location <URL>. A list of possbile mirrors can be found at
# https://www.ctan.org/mirrors
# You can also leave the option unset to use the auto-selection of the closes/fastest mirror available
RUN \
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -q -O- | tar -xz -C /tmp && \
  cd /tmp/install-tl* && \
  ./install-tl \
    --profile=/tmp/texlive.profile && \
  echo $? && \
  rm -rf /tmp/texlive* /tmp/install-tl*

RUN tlmgr update --self && tlmgr update --all

RUN groupadd -g 1000 latex && useradd -u 1000 -g latex latex

USER latex
