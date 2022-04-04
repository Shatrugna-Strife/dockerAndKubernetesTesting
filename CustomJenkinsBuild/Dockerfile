ARG DEBIAN_FRONTEND=noninteractive

ARG UBUNTU_VERSION="latest"
FROM ubuntu:$UBUNTU_VERSION

WORKDIR /root

RUN apt-get update

# RUN apt-get install --no-install-recommends --yes curl

# RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes apt-utils dialog

# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes wget

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes default-jdk

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes maven

RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes git

# apt-get install --no-install-recommends --yes dialog apt-utils

# RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

ARG JENKINS_WAR_URL="https://get.jenkins.io/war-stable/2.332.1/jenkins.war"

RUN cd /root

RUN wget --no-check-certificate $JENKINS_WAR_URL

WORKDIR /root

# COPY ./entrypoint.sh /entrypoint.sh

# RUN chmod 777 /entrypoint.sh

EXPOSE 8080

# HEALTHCHECK CMD curl --fail http://localhost:9091 || exit 1

ENTRYPOINT [ "java","-jar","/root/jenkins.war"]