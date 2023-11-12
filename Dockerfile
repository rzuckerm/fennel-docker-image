FROM alpine:3.18.2

COPY FENNEL_* /tmp/
RUN apk update && \
    apk add wget && \
    mkdir -p /opt/fennel && \
    cd /opt/fennel && \
    wget https://fennel-lang.org/downloads/fennel-$(cat /tmp/FENNEL_VERSION)-x86_64 -O fennel && \
    chmod +x fennel && \
    mv fennel /usr/local/bin && \
    cd / && \
    rm -rf /opt/fennel && \
    apk del wget
