from langchain_ollama import ChatOllama
import time
from langchain.chains import LLMChain
from common.medical_promt import medical_analysis_prompt
from common.models import PatientAnalysisRequest
from rag.medical_knowledge_rag import MedicalRag


class MedicalAnalysis:
    def __init__(self):
        self.llm = ChatOllama(model="mistral:latest")
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


        context = f"Patient Info: {patient_info}, Vitals: {vitals_info}, Diagnoses: {diagnoses_info}"
     
        retrieved_docs = self.rag.retrieve(context)
     
        retrieved_context = "\n".join([doc.page_content for doc in retrieved_docs])
    
        combined_context = f"Additional context from medical documents: {retrieved_context}"

    
        result = self.analysis_chain.invoke({
            "patient": patient_info,
            "vitals": vitals_info,
            "diagnoses": diagnoses_info,
            "context": combined_context
        })
       

        return {
            "vitals_analysis": result["vitals_analysis"]
           
}


        