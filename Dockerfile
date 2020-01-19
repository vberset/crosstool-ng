FROM ubuntu:18.04

RUN apt-get -y update --fix-missing && \
    apt-get upgrade -y && \
    apt-get -y install --fix-missing bash build-essential automake autoconf \
        libtool gawk git wget gperf bison flex texinfo \
	help2man libncurses5-dev bash && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src

RUN wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.23.0.tar.xz && \
    tar xf crosstool-ng-1.23.0.tar.xz && \
    rm crosstool-ng-1.23.0.tar.xz

WORKDIR crosstool-ng-1.23.0

RUN ./configure --prefix=/usr/local && \
    make && \
    make install

RUN cp ct-ng.comp /etc/bash_completion.d/
