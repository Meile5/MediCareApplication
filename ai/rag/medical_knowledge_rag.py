from langchain_community.vectorstores import FAISS
from langchain_ollama import OllamaEmbeddings
from langchain_community.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter

class MedicalRag:
    def __init__(self):
        self.retriever = self._retrieve_documents()


    def _retrieve_documents(self):
        from pathlib import Path
    
        current_dir = Path(__file__).parent.absolute()
    
        pdf_paths = [
            str(current_dir / "medical_files" / "vital_sign_guidelines.pdf"),
        ]
        documents = []
        for path in pdf_paths:
            try:
                loader = PyPDFLoader(path)
                documents.extend(loader.load())
            except Exception as e:
                print(f"Error loading {path}: {e}")

        text_splitter = RecursiveCharacterTextSplitter(chunk_size=1500, chunk_overlap=200)
        chunks = text_splitter.split_documents(documents)

        print(f"Number of chunks: {len(chunks)}")  # Verify the number of chunks
        if len(chunks) > 0:
            print(f"First chunk: {chunks[0].page_content[:500]}")  # Print the first chunk (partial content)
        

        embeddings = OllamaEmbeddings(model="nomic-embed-text")
       
        vectorstore = FAISS.from_documents(chunks, embeddings)
        # k controls how many document chunks to retrieve and which are the most relevant 
        return vectorstore.as_retriever(search_kwargs={"k":5})
    
    def retrieve(self, context):
        print(f"Context for retrieval: {context}")
        results = self.retriever.invoke(context)

        return results
        
