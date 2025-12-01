#!/bin/bash

echo "=== Installing Tailscale ==="
curl -fsSL https://tailscale.com/install.sh | sh

echo "=== Starting tailscaled (userspace mode) ==="
sudo nohup tailscaled --tun=userspace-networking --socks5-server=localhost:1055 > tailscaled.log 2>&1 &

sleep 3

AUTH_KEY="tskey-a"

echo "=== Logging in with AUTH_KEY ==="
sudo tailscale up --authkey "$AUTH_KEY" --hostname=codespace-node --advertise-exit-node --reset

echo ""
echo "=========================================="
echo " 🚀 Tailscale 已启动成功"
echo " SOCKS5 代理地址: 127.0.0.1:1055"
echo " Exit Node 功能已开启（用户态模式）"
echo "=========================================="
echo ""
echo "日志文件：tailscaled.log"
