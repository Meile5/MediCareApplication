import io
from fpdf import FPDF
import re

class CreatePdf:
    def __init__(self):
        pass


    def create(self, patient_data, analysis):
        pdf = FPDF()
        pdf.add_page()

        #header
        pdf.set_font("Arial", "B", 16)
        pdf.cell(0, 10, f"Patient Health Analysis Report", ln=True)
        pdf.ln(10)
        
        # patient info
        pdf.set_font("Arial", "B", 12)
        pdf.cell(0, 10, "Patient Information:", ln=True)
        pdf.set_font("Arial", "", 12)
        pdf.cell(0, 10, f"Name: {patient_data.name}", ln=True)
        pdf.cell(0, 10, f"DOB: {patient_data.age}", ln=True)
        pdf.cell(0, 10, f"Gender: {patient_data.gender}", ln=True)

        pdf.set_font("Arial", "B", 14)
        pdf.cell(0, 15, "Medical Analysis", ln=True)

        pdf.set_font("Arial", "", 12)
        cleaned_analysis = analysis.replace('’', "'").replace('“', '"').replace('”', '"').replace('–', '-').replace('—', '-')
        cleaned_analysis = re.sub(r'\*\*(.*?)\*\*', r'\1', cleaned_analysis)  # remove bold
        cleaned_analysis = re.sub(r'##+', '', cleaned_analysis)               # remove markdown headings
        cleaned_analysis = cleaned_analysis.replace('\r\n', '\n') 
        
        # Split text into paragraphs
        paragraphs = re.split(r'\n\s*\n', cleaned_analysis.strip())

        # Render each paragraph nicely
        for para in paragraphs:
            if para.strip():
             pdf.multi_cell(0, 10, para)
             pdf.ln(4)  

        pdf_bytes = io.BytesIO()
        pdf_output = pdf.output(dest="S").encode("latin-1")
        pdf_bytes.write(pdf_output)
        pdf_bytes.seek(0)
        return pdf_bytes.getvalue()
        