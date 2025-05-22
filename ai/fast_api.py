from fastapi import FastAPI
from common.medical_promt import medical_analysis_prompt
from common.models import PatientAnalysisRequest
from analysis.analyze_patient_data import MedicalAnalysis
from analysis.create_pdf import CreatePdf
from fastapi.responses import Response
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:49950"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/analyze")
async def analyze_patent(data: PatientAnalysisRequest):
    
    analyzer = MedicalAnalysis()
    result = analyzer.make_analysis(data)
    pdf_creator = CreatePdf()
    result_converted_to_pdf = pdf_creator.create(data.patient, result["vitals_analysis"])

    return Response(
        content=result_converted_to_pdf,
        media_type="application/pdf",
        headers={"Content-Disposition": "inline; filename=patient_analysis.pdf"}
    )



