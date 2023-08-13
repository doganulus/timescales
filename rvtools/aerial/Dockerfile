ARG OCAML_VERSION=4.11
FROM ocaml/opam:ubuntu-22.04-ocaml-${OCAML_VERSION} as builder

ARG AERIAL_VERSION=master

RUN sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && sudo apt-get -y install \
        subversion \
        m4 \
        libgmp-dev \
    && sudo apt-get autoremove -y && sudo apt-get clean -y && sudo rm -rf /var/lib/apt/lists/* 

RUN opam install ocamlfind menhir safa qcheck

RUN git clone --depth=1 --branch $AERIAL_VERSION https://bitbucket.org/traytel/aerial.git /tmp/aerial \
    && cd /tmp/aerial \
    && eval $(opam env) \
    && make \
    && mkdir -p /home/opam/.local/bin/ && cp /tmp/aerial/aerial.native /home/opam/.local/bin/aerial \
    && rm -rf /tmp/aerial

FROM ghcr.io/doganulus/rvbenchmark-base:latest

COPY --from=builder /home/opam/.local/ /usr/local/

WORKDIR /timescales

CMD ["/timescales/rvtools/aerial/benchmark.sh"]