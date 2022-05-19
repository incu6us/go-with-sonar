FROM clmr/go-with-sonar:latest

ARG GOLANG_VERSION=1.13

ENV PATH=/opt/java/openjdk/bin:/opt/sonar-scanner/bin:/opt/nodejs/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/tmp/.gvm/gos/go${GOLANG_VERSION}/bin
ENV GO_VERSION=$GOLANG_VERSION
ENV GO111MODULE=auto
ENV GOSUMDB=off
ENV GOPROXY=direct
ENV GOPATH=/tmp/.gvm/pkgsets/go${GOLANG_VERSION}/global
ENV GOROOT=/tmp/.gvm/gos/go${GOLANG_VERSION}

RUN apk add --no-cache binutils bison gcc
RUN curl -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer -o gvm-installer.sh
RUN chmod +x gvm-installer.sh
RUN ./gvm-installer.sh
RUN bash -c "source /tmp/.gvm/scripts/gvm && gvm install go${GOLANG_VERSION} -B && gvm use go${GOLANG_VERSION} --default"

CMD ["/bin/sh"]
