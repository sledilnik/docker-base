FROM node:10-buster

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /app
# dotnet repo
RUN wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb && \
  dpkg -i /tmp/packages-microsoft-prod.deb && rm /tmp/packages-microsoft-prod.deb
# yarn repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# install stuff
RUN apt-get update -y && \
    apt-get install -y dotnet-sdk-3.1 yarn
ADD . /app