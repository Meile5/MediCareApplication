import 'dart:typed_data';

import 'package:flutter/material.dart';

@immutable
sealed class PdfState {}

final class PdfInitial extends PdfState {}

final class PdfLoading extends PdfState {}

final class PdfError extends PdfState {
  final String message;
  PdfError({required this.message});
}

final class PdfLoaded extends PdfState {
  final Uint8List pdfBytes;
  PdfLoaded({required this.pdfBytes});
}
