from qdrant_client import QdrantClient
from qdrant_client.models import Distance, PointStruct, VectorParams

client = QdrantClient(url="http://localhost:6333")

if not client.collection_exists("lab"):
    client.create_collection(
        collection_name="lab",
        vectors_config=VectorParams(size=4, distance=Distance.COSINE),
    )

client.upsert(
    collection_name="lab",
    points=[
        PointStruct(id=1, vector=[0.10, 0.20, 0.30, 0.40], payload={"title": "relational databases"}),
        PointStruct(id=2, vector=[0.90, 0.10, 0.05, 0.00], payload={"title": "vector search"}),
        PointStruct(id=3, vector=[0.15, 0.25, 0.35, 0.45], payload={"title": "sql indexes"}),
    ],
)

hits = client.query_points(
    collection_name="lab",
    query=[0.12, 0.22, 0.32, 0.42],
    limit=2,
    with_payload=True,
).points

for hit in hits:
    print(hit.id, hit.score, hit.payload)
