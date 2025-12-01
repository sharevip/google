#!/bin/bash
# 每 5 分钟输出一次，让 Codespace 保持活跃
while true; do
  echo "Keepalive: $(date)"
  sleep 300
done
