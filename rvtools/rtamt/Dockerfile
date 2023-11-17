# FROM ubuntu:22.04 as builder

# ARG RTAMT_VERSION=master

# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install \
#         git \
#         build-essential \
#         ninja-build \
#         cmake \
#         antlr4 \
#         libboost-all-dev \
#         python3-dev \
#         python3-pip \
#     && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 

# RUN git clone https://github.com/nickovic/rtamt.git /tmp/rtamt/ \
#     && cmake -S/tmp/rtamt/rtamt -B/tmp/rtamt/build -DPythonVersion=3 \
#     && cmake --build /tmp/rtamt/build \
#     && cd /tmp/rtamt/ && pip3 install .

FROM ghcr.io/bounverif/rvbenchmark-base:latest

# COPY --from=builder /usr/local/lib/ /usr/local/lib/

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        python3 \
        python3-pip \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 

RUN pip install rtamt jsonlines

CMD ["/timescales/rvtools/rtamt/benchmark.sh"]
