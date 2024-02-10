from langchain.vectorstores import FAISS
from langchain.embeddings import OpenAIEmbeddings
from langchain.embeddings.sentence_transformer import SentenceTransformerEmbeddings


class Memory:
    def __init__(self, **kwargs):
        self._embeddings = SentenceTransformerEmbeddings()

    def get_embeddings(self):
        return self._embeddings
