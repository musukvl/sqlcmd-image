ARG UBUNTU_RELEASE="focal"
ARG UBUNTU_VERSION="20.04"

FROM mcr.microsoft.com/dotnet/sdk:6.0-${UBUNTU_RELEASE}

RUN apt-get update && apt-get install -y wget curl ca-certificates gnupg mc net-tools procps openssl 
RUN apt-get install -y apt-transport-https ca-certificates gnupg jq software-properties-common unzip zip python3.9 python3-pip python3-dev python3-virtualenv apt-utils build-essential tree

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update 
ENV ACCEPT_EULA=Y
RUN apt-get install -y   mssql-tools

ENTRYPOINT ["sh", "-c", "tail -f /dev/null"]
