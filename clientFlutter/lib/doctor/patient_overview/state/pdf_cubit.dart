
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/patient_overview/state/pdf_state.dart';

import '../models/patients_overview_models.dart';
import '../utils/patients_overview_data_source.dart';

class PdfCubit extends Cubit<PdfState>{
  final PatientsOverviewDataSource dataSource;

  PdfCubit({required this.dataSource}) : super(PdfInitial());

  Future<void> loadPdf(PatientAnalysisRequest request) async {
    emit(PdfLoading());
    try {
      final pdfBytes = await dataSource.handlePdf(request);
      emit(PdfLoaded(pdfBytes: pdfBytes));
    } catch (e) {
      emit(PdfError( message: ''));
    }
  }
}