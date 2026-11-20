<div align="center">
<img src="assets/brand-logo.svg" alt="Arya Fatthurahman" width="120" />
</div>

# Qdrant Lab

<sub>Run Qdrant in Docker, create a collection, upsert vectors, and run similarity search over REST and Python.</sub>

<p>
  <img src="https://img.shields.io/badge/Database-Qdrant-DC244C?style=flat-square" alt="Database: Qdrant" />
  <img src="https://img.shields.io/badge/Category-Vector%20database-6366F1?style=flat-square" alt="Category: Vector database" />
  <img src="https://img.shields.io/badge/Runs%20in-Docker-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Runs in Docker" />
  <img src="https://img.shields.io/badge/License-MIT-22C55E?style=flat-square" alt="License: MIT" />
  <a href="https://github.com/devarent/qdrant-lab/actions/workflows/compose-check.yml"><img src="https://github.com/devarent/qdrant-lab/actions/workflows/compose-check.yml/badge.svg" alt="compose-check" /></a>
</p>

## What this lab is

Qdrant is a vector database for semantic search and retrieval-augmented generation. This lab starts a local instance, uses a toy four-dimensional vector so the math stays visible, and shows the same workflow through the REST API and the Python client.

## Quickstart

```bash
docker compose up -d
bash examples/01_create_collection.sh
bash examples/02_upsert_search.sh
open http://localhost:6333/dashboard
python -m pip install qdrant-client
python examples/qdrant_client.py
```

## Connection details

| Field | Value |
| --- | --- |
| REST | `http://localhost:6333` |
| gRPC | `localhost:6334` |
| Dashboard | `http://localhost:6333/dashboard` |
| Collection | `lab` |
| Vector size | `4 (toy vectors; replace with your embedding dimension)` |

## Examples

| File | What it shows |
| --- | --- |
| [`docker-compose.yml`](docker-compose.yml) | Engine, ports, and persistent volume. |
| [`.github/workflows/compose-check.yml`](.github/workflows/compose-check.yml) | Validates the Compose file on every push. |
| [`examples/01_create_collection.sh`](examples/01_create_collection.sh) | Create a collection with cosine distance. |
| [`examples/02_upsert_search.sh`](examples/02_upsert_search.sh) | Upsert three points and search for the nearest one. |
| [`examples/qdrant_client.py`](examples/qdrant_client.py) | The same workflow with the Python client. |

## Exercises

1. Replace the toy vectors with sentence embeddings and search for a natural-language query.
2. Add a payload index on `title` and filter the search by payload.
3. Delete a point and confirm it no longer appears in results.
4. Compare cosine, dot product, and Euclidean distance on the same vectors.

## Notes and limits

- The four-dimensional vectors are intentionally small so you can inspect them by hand.
- The dashboard is served at `/dashboard`; the REST API is on port 6333 and gRPC on 6334.
- Data persists in the `qdrant-data` volume.
- For production, add authentication and TLS; the default local setup has neither.

## Run it from anywhere

This lab publishes its ports on `127.0.0.1` only. To use it from another country, do **not** open the database port to the internet. Pick one:

- **VPS + private tunnel:** run the lab on a small Ubuntu VPS, keep the port closed, and connect through WireGuard or `ssh -L`.
- **Managed service:** use a managed free tier for this engine and point the same examples at its connection string.
- **HTTP UI only:** if the engine has a web UI, put it behind Caddy with TLS and basic auth.

The shared checklist, provider map, and commands are in **[REMOTE-ACCESS.md](https://github.com/devarent/database-labs/blob/main/REMOTE-ACCESS.md)**.

## Cleanup

```bash
docker compose down -v
```

`-v` also removes the named volume, so the next start is a clean slate.

## References

- [Qdrant documentation](https://qdrant.tech/documentation/)
- [Qdrant REST API](https://api.qdrant.tech/)
- [qdrant-client](https://github.com/qdrant/qdrant-client)

---

<sub>Part of the <a href="https://github.com/devarent/database-labs">database-labs</a> collection: 26 database engines, one index.</sub>

## License

MIT (c) 2026 Arya Fatthurahman. See [LICENSE](LICENSE).
