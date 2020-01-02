FROM ubuntu:bionic as baseos
MAINTAINER faithfulst3ward <faithfulst3ward@protonmail.com>
#
WORKDIR /app
#
RUN  sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list \
     && export DEBIAN_FRONTEND=noninteractive \
     && apt-get update \
     && apt-get upgrade -y --no-install-recommends \
     && apt-get install -y --no-install-recommends \
     bash \
     ca-certificates \
     curl \
     p7zip-full
#
RUN apt-get autoremove -y \
     && apt-get clean -y \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc   
#
RUN curl -L https://c2.hak5.org/download/community --output c2.zip \
     && 7z e c2.zip /tmp \
     cp /tmp/cp c2_community-linux-64 /app
#
COPY start.sh /app
#
RUN rm /app/c2.zip
#
CMD ["./start.sh"]
#
EXPOSE 2022 8080
