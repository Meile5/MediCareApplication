from fastapi import FastAPI, Request
from pydantic import BaseModel
from langchain.chains import RetrievalQA
from langchain.chat_models import ChatOpenAI
from medical_promt import medical_analysis_prompt
from models import PatientAnalysisRequest
from analyze_patient_data import MedicalAnalysis
from create_pdf import CreatePdf
from fastapi.responses import Response


app = FastAPI()

@app.post("/analyze")

async def analyze_patent(data: PatientAnalysisRequest):
    analyzer = MedicalAnalysis()
    result = analyzer.make_analysis(data)
    pdf_creator = CreatePdf()
    result_converted_to_pdf = pdf_creator.create(data.patient, result["vitals_analysis"])

     # Return PDF as a streaming response
    return Response(
        content=result_converted_to_pdf,  # PDF content (in BytesIO format)
        media_type="application/pdf",  # Indicating that it's a PDF file
        headers={"Content-Disposition": "inline; filename=patient_analysis.pdf"}  # Display inline in browser or as an attachment
    )




