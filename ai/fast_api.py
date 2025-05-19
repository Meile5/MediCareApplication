from fastapi import FastAPI, Request
from pydantic import BaseModel
from langchain.chains import RetrievalQA
from langchain.chat_models import ChatOpenAI
from medical_promt import medical_analysis_prompt
from models import PatientAnalysisRequest
from analyze_patient_data import MedicalAnalysis
from create_pdf import CreatePdf
from fastapi.responses import Response
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:50915"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/analyze")

@app.post("/analyze")
async def analyze_patent(data: PatientAnalysisRequest):
   # raw_body = await request.body()
    #print("DEBUG raw request body:", raw_body.decode())
    
    # Now you can use `data` as usual
    analyzer = MedicalAnalysis()
    result = analyzer.make_analysis(data)
    pdf_creator = CreatePdf()
    result_converted_to_pdf = pdf_creator.create(data.patient, result["vitals_analysis"])

    return Response(
        content=result_converted_to_pdf,
        media_type="application/pdf",
        headers={"Content-Disposition": "inline; filename=patient_analysis.pdf"}
    )



