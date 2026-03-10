FROM ubuntu:22.04

RUN apt update && \
    apt install -y curl socat && \
    curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
    -o /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

WORKDIR /app

COPY start.sh .
COPY hostname.txt .

RUN chmod +x start.sh

CMD ["./start.sh"]
