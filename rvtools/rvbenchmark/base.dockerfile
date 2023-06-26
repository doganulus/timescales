FROM ubuntu:22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        tini \
        hyperfine \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 

# Copy the script to the container
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Tini correctly initialize the shell in the container
# With the -g option, tini kills the child process group.
# This corresponds more closely to what happens when you do ctrl-C
# See: https://github.com/krallin/tini
ENTRYPOINT ["tini", "-g", "--", "/entrypoint.sh"]
