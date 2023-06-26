FROM ubuntu:22.04 as builder

ARG REELAY_VERSION=v2008

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        git \
        build-essential \
        automake \
        autotools-dev \
        libboost-dev \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/doganulus/cudd.git /tmp/cudd \
    && cd /tmp/cudd \
    && ./configure && aclocal && autoconf \
    && ./configure --enable-silent-rules --enable-obj \
    && make && make install \
    && cd / && rm -rf /tmp/cudd

RUN git clone https://github.com/doganulus/reelay.git /tmp/reelay/ \
    && cd /tmp/reelay \
    && make apps && make apps-install \
    && cd / && rm -rf /tmp/reelay

FROM ghcr.io/bounverif/rvbenchmark-base:latest

COPY --from=builder /usr/local/bin/ /usr/local/
CMD ["/timescales/rvtools/reelay2008/benchmark.sh"]