import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: ScreenDesigner(),
    ),
  );
}

class ScreenDesigner extends StatelessWidget {
  const ScreenDesigner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Designer"),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(
          pageType: PdfPageFormat.a4,
        ),
      ),
    );
  }
}

Future<Uint8List> _generatePdf({required PdfPageFormat pageType}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: pageType,
      build: (context) => pw.Center(
        child: pw.Text("Hello PDF"),
      ),
    ),
  );

  return pdf.save();
}
