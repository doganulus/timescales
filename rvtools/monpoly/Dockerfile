ARG OCAML_VERSION=4.11
FROM ocaml/opam:ubuntu-22.04-ocaml-${OCAML_VERSION} as builder

ARG MONPOLY_VERSION=master

RUN git clone --depth=1 --branch $MONPOLY_VERSION https://bitbucket.org/monpoly/monpoly.git /tmp/monpoly \
    && cd /tmp/monpoly \
    && eval $(opam env) \
    && opam install --deps-only . \
    && dune build --release \
    && dune install --prefix /home/opam/.local \
    && rm -rf /tmp/monpoly

FROM ghcr.io/bounverif/rvbenchmark-base:latest

COPY --from=builder /home/opam/.local/ /usr/local/
CMD ["/timescales/rvtools/monpoly/benchmark.sh"]
