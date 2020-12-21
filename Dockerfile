FROM ubuntu:bionic as baseos

WORKDIR /app

RUN  sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list \
     && export DEBIAN_FRONTEND=noninteractive \
     && apt-get update \
     && apt-get upgrade -y --no-install-recommends \
     && apt-get install -y --no-install-recommends \
     bash \
     ca-certificates \
     curl \
     p7zip-full


RUN apt-get autoremove -y \
     && apt-get clean -y \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc

RUN curl -L https://c2.hak5.org/download/community --output c2.zip

RUN 7z e c2.zip -o/tmp

RUN cp /tmp/c2*_amd64_linux /app/c2_community-linux-64

RUN chmod 755 /app/c2_community-linux-64

COPY start.sh /app

RUN chmod 755 /app/start.sh

RUN rm /app/c2.zip

CMD ["/app/start.sh"]

EXPOSE 2022 8080