from langchain_ollama import ChatOllama
import time
from langchain.chains import RetrievalQA, LLMChain, SequentialChain
from medical_promt import medical_analysis_prompt, patient_summary_prompt, recommendations_prompt
from models import PatientAnalysisRequest
from rag.medical_knowledge_rag import MedicalRag


class MedicalAnalysis:
    def __init__(self):
        self.llm = ChatOllama(model="gemma:2b")
        self.rag = MedicalRag()
        
        self.retriever = self.rag.retriever

        self.analysis_chain = LLMChain(
            llm=self.llm,
            prompt=medical_analysis_prompt,
            output_key="vitals_analysis"
        )

    def make_analysis(self, request:PatientAnalysisRequest):
        start_time = time.time()
        patient_info = request.patient
        vitals_info = request.vitals
        diagnoses_info = request.diagnoses

        patient_info_start_time = time.time()

        context = f"Patient Info: {patient_info}, Vitals: {vitals_info}, Diagnoses: {diagnoses_info}"
        patient_info_end_time = time.time()
       # print(f"Time to gather patient info and create context: {patient_info_end_time - patient_info_start_time} seconds")

        retrieval_start_time = time.time()
        #print("Starting document retrieval...")
        retrieved_docs = self.rag.retrieve(context)
       # print("Document retrieval finished.")
        retrieval_end_time = time.time()
       # print(f"Time to retrieve documents: {retrieval_end_time - retrieval_start_time} seconds")
        processing_retrieved_docs_start_time = time.time()
        retrieved_context = "\n".join([doc.page_content for doc in retrieved_docs])
        processing_retrieved_docs_end_time = time.time()
        #print(f"Time to process retrieved documents: {processing_retrieved_docs_end_time - processing_retrieved_docs_start_time} seconds")

        combined_context = f"Additional context from medical documents: {retrieved_context}"

        chain_start_time = time.time()
        print("Entering chain...")
        result = self.analysis_chain.invoke({
            "patient": patient_info,
            "vitals": vitals_info,
            "diagnoses": diagnoses_info,
            "context": combined_context
        })
        chain_end_time = time.time()
        print(f"Time to execute LLM chain: {chain_end_time - chain_start_time} seconds")


        return {
            "vitals_analysis": result["vitals_analysis"]
           
}


        