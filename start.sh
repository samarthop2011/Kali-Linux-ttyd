#!/bin/bash

export PORT=${PORT:-7681}

echo "Starting ttyd on port ${PORT}"

exec ttyd \
  --writable \
  --port ${PORT} \
  /bin/bash
