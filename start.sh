#!/bin/bash

HOST=$(cat hostname.txt)

echo "Starting TCP proxy..."

# contoh service lokal
socat TCP-LISTEN:443,fork TCP:dagnam.xyz:4629 &

echo "Starting Cloudflare tunnel..."

nohup cloudflared access tcp \
--hostname "$HOST" \
--url 127.0.0.1:443 \
>/dev/null 2>&1 &

sleep 5

echo "Tunnel running for $HOST"

# menjaga container tetap hidup
tail -f /dev/null
