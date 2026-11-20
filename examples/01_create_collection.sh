#!/usr/bin/env bash
set -euo pipefail
curl -sS -X PUT "http://localhost:6333/collections/lab" \
  -H "Content-Type: application/json" \
  -d '{"vectors": {"size": 4, "distance": "Cosine"}}'
echo
