import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class LihatPDFPage extends StatefulWidget {
  final File file;
  const LihatPDFPage({Key? key, required this.file}) : super(key: key);

  @override
  _LihatPDFPageState createState() => _LihatPDFPageState();
}

class _LihatPDFPageState extends State<LihatPDFPage> {
  @override
  Widget build(BuildContext context) {
    final nama = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(title: Text(nama.toString())),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
