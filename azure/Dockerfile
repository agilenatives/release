FROM python:alpine

RUN apk add --no-cache bash curl coreutils ca-certificates git jq make openssl openssh sudo shadow zip

ENV AZURE_CLI_VERSION=2.2.0
RUN apk add --no-cache perl \
    && apk add --no-cache --virtual .build-deps gcc make openssl-dev libffi-dev musl-dev linux-headers \
    && apk add --no-cache libintl icu-libs libc6-compat \
    && update-ca-certificates
RUN curl -LO https://github.com/Azure/azure-cli/archive/azure-cli-${AZURE_CLI_VERSION}.zip \
    && unzip azure-cli-${AZURE_CLI_VERSION}.zip \
    && rm -f azure-cli-${AZURE_CLI_VERSION}.zip \
    && mv azure-cli-azure-cli-${AZURE_CLI_VERSION} azure-cli \
    && azure-cli/scripts/install_full.sh \
    && cat azure-cli/az.completion > /root/.bashrc \
    && rm -rf azure-cli
RUN apk add --virtual .rundeps $( \
      scanelf --needed --nobanner --recursive /usr/local \
      | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
      | sort -u \
      | xargs -r apk info --installed \
      | sort -u \
    ) \
    && dos2unix /root/.bashrc /usr/local/bin/az
RUN az --version

ENV TERRAFORM_VERSION=0.12.24
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/bin/terraform \
    && chmod +x /usr/bin/terraform
RUN terraform --version

ENV KUBECTL_VERSION=1.18.1
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && mv kubectl /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl
RUN kubectl version --client

ENV HELM_VERSION=3.1.0
RUN curl -LO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar xf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && rm -f helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/bin/helm \
    && chmod +x /usr/bin/helm \
    && rm -rf linux-amd64
RUN helm version --client
