#!/bin/bash

echo "Starting TCP proxy..."

socat TCP-LISTEN:443,fork TCP:dagnam.xyz:4629 &

echo "Starting Cloudflare tunnel..."

cloudflared tunnel run --token $TUNNEL_TOKEN
