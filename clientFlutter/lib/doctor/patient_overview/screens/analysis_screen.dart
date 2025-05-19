import 'dart:ui_web';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;
import '../../../common/widgets_shared/message_display.dart';
import '../../../errorHandling/application_messages.dart';
import '../../overview/screens/doctor_overview_screen.dart';
import '../models/patients_overview_models.dart';
import '../state/pdf_cubit.dart';
import '../state/pdf_state.dart';

class AnalysisScreen extends StatefulWidget{
  final PatientAnalysisRequest request;
  const AnalysisScreen({
    super.key,
    required this.request});


  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
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
            final blob = html.Blob([state.pdfBytes], 'application/pdf');
            final url = html.Url.createObjectUrlFromBlob(blob);
            final viewId = 'iframe-${DateTime.now().millisecondsSinceEpoch}';

            platformViewRegistry.registerViewFactory(
              viewId,
                  (int viewId) => html.IFrameElement()
                ..src = url
                ..style.border = 'none'
                ..width = '100%'
                ..height = '100%',
            );
            return HtmlElementView(viewType: viewId);
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