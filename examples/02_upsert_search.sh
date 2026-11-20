#!/usr/bin/env bash
set -euo pipefail
curl -sS -X PUT "http://localhost:6333/collections/lab/points?wait=true" \
  -H "Content-Type: application/json" \
  -d '{
    "points": [
      {"id": 1, "vector": [0.10, 0.20, 0.30, 0.40], "payload": {"title": "relational databases"}},
      {"id": 2, "vector": [0.90, 0.10, 0.05, 0.00], "payload": {"title": "vector search"}},
      {"id": 3, "vector": [0.15, 0.25, 0.35, 0.45], "payload": {"title": "sql indexes"}}
    ]
  }'
echo
curl -sS -X POST "http://localhost:6333/collections/lab/points/search" \
  -H "Content-Type: application/json" \
  -d '{"vector": [0.12, 0.22, 0.32, 0.42], "limit": 2, "with_payload": true}'
echo
