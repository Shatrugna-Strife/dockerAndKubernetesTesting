ARG DEBIAN_FRONTEND=noninteractive

ARG UBUNTU_VERSION="latest"
FROM ubuntu:$UBUNTU_VERSION



ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000
ARG JENKINS_HOME=/jenkins_home

RUN mkdir -p $JENKINS_HOME \
  && chown ${uid}:${gid} $JENKINS_HOME \
  && groupadd -g ${gid} ${group} \
  && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

# WORKDIR /root

RUN apt-get update

# RUN DEBIAN_FRONTEND=noninteractive apt install software-properties-common -y --no-install-recommends

# RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:git-core/ppa

# RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt install git -y --no-install-recommends

RUN apt-get install ca-certificates curl gnupg lsb-release -y --no-install-recommends

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update

RUN apt-get install docker-ce-cli -y --no-install-recommends

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# RUN apt-get install --no-install-recommends --yes curl

# RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes apt-utils dialog

# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes wget

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes default-jdk

# RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes default-jre

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes maven

# RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes git

# apt-get install --no-install-recommends --yes dialog apt-utils

# RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

ARG JENKINS_WAR_URL="https://get.jenkins.io/war-stable/2.332.2/jenkins.war"

RUN cd $JENKINS_HOME

WORKDIR $JENKINS_HOME

RUN wget --no-check-certificate $JENKINS_WAR_URL

# WORKDIR /root

# COPY ./entrypoint.sh /entrypoint.sh

# RUN chmod 777 /entrypoint.sh

EXPOSE 8080

EXPOSE 50000

USER ${user}

ENV JENKINS_DIR=$JENKINS_HOME

# HEALTHCHECK CMD curl --fail http://localhost:9091 || exit 1

ENTRYPOINT java -jar $JENKINS_DIR/jenkins.war