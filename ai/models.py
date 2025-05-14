from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime

class VitalSign(BaseModel):
    vital_type: str
    vital_value: float
    measurement_date: datetime

class Diagnosis(BaseModel):
    patient_diagnosis: str
    treatment: str
    date: datetime

class Patient(BaseModel):
    id: int
    name: str
    gender: str
    date_of_birth: datetime
    medical_history: List[str] = []

class PatientAnalysisRequest(BaseModel):
    patient: Patient
    vitals: List[VitalSign]
    diagnoses: Optional[List[Diagnosis]] = []