from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime

class VitalsSignsDto(BaseModel):
    oxygenLevel: Optional[float] = None
    bodyTemperature: Optional[float] = None
    heartRate: Optional[int] = None
    createdAt: datetime

class DiagnosesDto(BaseModel):
    patientDiagnosis: str
    treatment: str
    date: datetime

class PatientDto(BaseModel):
    userid: str
    name: str
    surname: str
    gender: str
    age: str
    bloodtype: str
    allergies: Optional[str] = None
    phonenumber: str
    address: str
    deviceId: Optional[str] = None

class PatientAnalysisRequest(BaseModel):
    patient: PatientDto
    vitals: List[VitalsSignsDto]
    diagnoses: Optional[List[DiagnosesDto]] = []
