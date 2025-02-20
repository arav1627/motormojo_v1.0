from pymongo import MongoClient

try:
    client = MongoClient("mongodb://localhost:27017")
    db = client["MojoMotorDB"]
    print("✅ Connected to MongoDB successfully!")

    # Check collections
    collections = db.list_collection_names()
    print(f"Available Collections: {collections}")

except Exception as e:
    print(f"❌ Error: {e}")
