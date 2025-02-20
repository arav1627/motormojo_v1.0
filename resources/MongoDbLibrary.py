from pymongo import MongoClient

class MongoDbLibrary:
    def __init__(self):
        self.client = None
        self.db = None

    def connect_to_mongodb(self, uri="mongodb://localhost:27017", db_name="MojoMotorDB"):
        """Initialize the MongoDB connection."""
        self.client = MongoClient(uri)
        self.db = self.client[db_name]
        print("Connected to MongoDB successfully")

    def find_document(self, collection_name, query={}):
        """Find documents in a collection."""
        if not self.db:
            raise ValueError("Database connection not established. Call 'connect_to_mongodb' first.")
        collection = self.db[collection_name]
        return list(collection.find(query))

    def close_connection(self):
        """Close the MongoDB connection."""
        if self.client:
            self.client.close()
            print("Disconnected from MongoDB")
