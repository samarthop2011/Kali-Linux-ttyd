#!/bin/bash

echo "Railway PORT is: $PORT"

exec ttyd \
  --writable \
  --interface 0.0.0.0 \
  --port "${PORT}" \
  /bin/bash
