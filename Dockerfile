FROM mhart/alpine-node:12
MAINTAINER Evan Welsh <noreply@evanwelsh.com>

LABEL name="lint-condo" version="1.0"

COPY provision.sh /
COPY requirements.txt /
COPY package.json /
COPY package-lock.json /

ENV GOPATH /gopath
ENV PATH /node_modules/.bin:$GOPATH/bin:$PATH

RUN apk add --no-cache bash && bash provision.sh

COPY src /usr/src/lint-condo

WORKDIR /src

CMD ["node", "/usr/src/lint-condo"]
