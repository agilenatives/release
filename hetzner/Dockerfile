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
    unzip

ENV HCLOUD_VERSION=1.16.2
RUN curl -LO https://github.com/hetznercloud/cli/releases/download/v${HCLOUD_VERSION}/hcloud-linux-amd64.tar.gz \
    && tar xf hcloud-linux-amd64.tar.gz \
    && rm -f hcloud-linux-amd64.tar.gz \
    && mv hcloud /usr/local/bin/hcloud \
    && chmod +x /usr/local/bin/hcloud 
RUN hcloud version

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

ENV HELM_VERSION=3.1.0
RUN curl -LO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar xf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && rm -f helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && rm -rf linux-amd64
RUN helm version --client
