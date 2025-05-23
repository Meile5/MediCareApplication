
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/widgets_shared/message_display.dart';
import '../../../errorHandling/application_messages.dart';
import '../../overview/screens/doctor_overview_screen.dart';
import '../models/patients_overview_models.dart';
import '../state/pdf_cubit.dart';
import '../state/pdf_state.dart';
import 'package:pdfrx/pdfrx.dart';

class WebAnalysisScreen extends StatefulWidget{
  final PatientAnalysisRequest request;
  const WebAnalysisScreen({
    super.key,
    required this.request});


  @override
  State<WebAnalysisScreen> createState() => _WebAnalysisScreenState();
}

class _WebAnalysisScreenState extends State<WebAnalysisScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PdfCubit>().loadPdf(widget.request);
  }

  @override
  Widget build(BuildContext context) {
    return DoctorScaffold(
      child:  BlocBuilder<PdfCubit, PdfState>(
        builder: (context, state) {
            if (state is PdfLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PdfLoaded) {
            return PdfViewer.data(state.pdfBytes, sourceName: "analysis.pdf");
          } else if (state is PdfError) {
            return const MessageDisplay(message: 'Failed to load Pdf.');
          } else {
            return MessageDisplay(message: ApplicationMessages.generalError.message);
          }
        },
      ),

    );

  }

}