FROM ghcr.io/doganulus/reelay-devel as builder

ARG VERSION=main
ARG REELAY_VERSION=${VERSION}

RUN git clone https://github.com/doganulus/reelay.git /tmp/reelay \
      --depth 1 \
      --branch ${REELAY_VERSION} \
    && cmake -S/tmp/reelay -B/tmp/reelay/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_REELAY_APPS=ON \
      -DBUILD_TESTS=OFF \
    && cmake --build /tmp/reelay/build/ --target install -j$(nproc) \
    && rm -rf /tmp/reelay

FROM ghcr.io/bounverif/rvbenchmark-base:latest

COPY --from=builder /usr/local/bin/ryjson /usr/local/bin/

WORKDIR /timescales

CMD ["/timescales/rvtools/reelay2008/benchmark.sh"]
