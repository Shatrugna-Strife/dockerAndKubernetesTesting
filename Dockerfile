ARG UBUNTU_VERSION="latest"
FROM ubuntu:$UBUNTU_VERSION

WORKDIR /

RUN apt-get update

RUN apt-get install --no-install-recommends --yes curl

RUN apt-get install --no-install-recommends --yes wget

# apt-get install --no-install-recommends --yes ca-certificates

# RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

ARG CODE_SERVER_URL="https://github.com/coder/code-server/releases/download/v4.1.0/code-server_4.1.0_amd64.deb"

RUN cd /root

RUN wget --no-check-certificate $CODE_SERVER_URL

RUN dpkg -i $(ls | grep "code-server_[0-9.]*_amd64.deb" | head -n 1)

RUN rm $(ls | grep "code-server_[0-9.]*_amd64.deb")

WORKDIR /root

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

EXPOSE 9091

HEALTHCHECK CMD curl --fail http://localhost:9091 || exit 1

ENTRYPOINT [ "/entrypoint.sh"]