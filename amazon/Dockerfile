FROM ubuntu:16.04

RUN  apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    curl \
    dnsutils \
    git \
    gnupg \
    jq \
    lsb-release \
    sudo \
    openssh-server \
    unzip \
    zip

ENV AWS_VERSION=2
RUN curl -LO https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
    && unzip awscli-exe-linux-x86_64.zip \
    && rm -f awscli-exe-linux-x86_64.zip \
    && ./aws/install
RUN aws --version

ENV TERRAFORM_VERSION=0.12.24
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/terraform \
    && chmod +x /usr/local/bin/terraform
RUN terraform --version

ENV KUBECTL_VERSION=1.18.1
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && mv kubectl /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
RUN kubectl version --client

ENV HELM_VERSION=3.2.1
RUN curl -LO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar xf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && rm -f helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && rm -rf linux-amd64
RUN helm version --client

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-client
RUN psql -V

RUN curl -sL https://www.mongodb.org/static/pgp/server-4.2.asc | \
    apt-key add - \
    && echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.2 multiverse" | \
    tee /etc/apt/sources.list.d/mongodb-org-4.2.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    mongodb-org-shell \
    mongodb-org-tools
RUN mongo --version
