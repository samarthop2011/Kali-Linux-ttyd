#!/bin/bash

echo "PORT=$PORT"

exec ttyd \
  --writable \
  --check-origin=false \
  --once=false \
  --interface 0.0.0.0 \
  --port "$PORT" \
  bash
