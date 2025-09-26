FROM ubuntu:12.04

ENV DEBIAN_FRONTEND=noninteractive

# Point APT to old-releases for EOL Ubuntu Precise and install required packages
RUN sed -i \
        -e 's|http://\(.*\)archive.ubuntu.com|http://old-releases.ubuntu.com|g' \
        -e 's|http://security.ubuntu.com|http://old-releases.ubuntu.com|g' \
        /etc/apt/sources.list \
    && apt-get update | cat \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        apt-transport-https \
    && apt-get install -y --no-install-recommends \
        java-common \
        default-jre \
        make \
        libssl0.9.8 \
    && rm -rf /var/lib/apt/lists/*


