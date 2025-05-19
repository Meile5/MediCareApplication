import io
from fpdf import FPDF

class CreatePdf:
    def __init__(self):
        pass


    def create(self, patient_data, analysis):
        pdf = FPDF()
        pdf.add_page()

        #header
        pdf.set_font("Arial", "B", 16)
        pdf.cell(0, 10, f"Patient Health Analysis Report", ln=True)
        
        # patient info
        pdf.set_font("Arial", "B", 12)
        pdf.cell(0, 10, "Patient Information:", ln=True)
        pdf.set_font("Arial", "", 12)
        pdf.cell(0, 10, f"Name: {patient_data.name}", ln=True)
        pdf.cell(0, 10, f"DOB: {patient_data.date_of_birth.strftime('%Y-%m-%d')}", ln=True)
        pdf.cell(0, 10, f"Gender: {patient_data.gender}", ln=True)

        pdf.set_font("Arial", "B", 14)
        pdf.cell(0, 15, "Medical Analysis", ln=True)

        pdf.set_font("Arial", "", 12)
        cleaned_analysis = analysis.replace('’', "'").replace('“', '"').replace('”', '"').replace('–', '-').replace('—', '-')
        
        # Split analysis into paragraphs
        paragraphs = cleaned_analysis.split('\n\n')
        for para in paragraphs:
            if para.strip():
                if ":" in para and len(para.split(":", 1)[0]) < 30:
                    # This looks like a heading
                    heading, content = para.split(":", 1)
                    pdf.set_font("Arial", "B", 12)
                    pdf.cell(0, 10, heading + ":", ln=True)
                    pdf.set_font("Arial", "", 12)
                    pdf.multi_cell(0, 10, content)
                else:
                    pdf.multi_cell(0, 10, para)
                pdf.ln(5)
        pdf_bytes = io.BytesIO()
        pdf_output = pdf.output(dest="S").encode("latin-1")
        pdf_bytes.write(pdf_output)
        pdf_bytes.seek(0)
        return pdf_bytes.getvalue()
        