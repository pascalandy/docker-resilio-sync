FROM devmtl/alpineglibc:3.9

MAINTAINER Pascal Andy <https://pascalandy.com>
LABEL com.resilio.version="2.6.3"

# rslsync --help / Resilio Sync 2.6.3 (1340) / 2019-02-04_10h26
#https://help.resilio.com/hc/en-us/articles/206216855-Sync-2-x-change-log
ENV RSLSYNC_SIZE=1024 \
    RSLSYNC_TRASH_TIME=14 \
    RSLSYNC_TRASH=true

COPY root/. /

RUN apk update && apk upgrade && \
    apk add --no-cache zip curl && \
    cd /root && \
    curl https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar xfz - && \
    mv rslsync /usr/local/bin && \
    rm -rf /var/cache/apk/*

VOLUME /data

EXPOSE 33333
EXPOSE 8888
