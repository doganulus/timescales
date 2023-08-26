# FROM sbtscala/scala-sbt:eclipse-temurin-jammy-8u352-b08_1.9.0_2.13.11

# ARG DEJAVU_VERSION=master

# RUN git clone --depth=1 --branch $DEJAVU_VERSION https://github.com/havelund/dejavu.git /tmp/dejavu 

# WORKDIR /tmp/dejavu

FROM ubuntu:22.04 as builder

ARG VERSION=master
ARG DEJAVU_VERSION=${VERSION}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        git \
        curl \
        openjdk-17-jre \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/havelund/dejavu.git /tmp/dejavu \
      --branch ${DEJAVU_VERSION} \
    && cd /tmp/dejavu && git checkout ccff1b6263c738231f101586cbce69a98ed9c59f \
    && cp /tmp/dejavu/out/dejavu /usr/local/bin/dejavu \
    && cp /tmp/dejavu/out/artifacts/dejavu_jar/dejavu.jar /usr/local/bin/dejavu.jar \
    && chmod +x /usr/local/bin/dejavu 

RUN mkdir -p /tmp/dejavu && cd /tmp/dejavu \
    && curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs \
    && chmod +x cs \
    && ./cs setup -y --dir /usr/local/bin --apps scala:2.11.12,scalac:2.11.12

FROM ghcr.io/doganulus/rvbenchmark-base:latest

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        openjdk-17-jre \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 

COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /tmp/dejavu/out/examples /examples
COPY --from=builder /tmp/dejavu/src/test/scala/tests_atva2020/dejavu-timing-atva-2020 /examples/timed

WORKDIR /dejavu

CMD ["/timescales/rvtools/dejavu/benchmark.sh"]
