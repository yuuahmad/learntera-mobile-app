// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/services/online_services/lihat_pdf.dart';
import 'package:provider/provider.dart';

class PesanMobile extends StatefulWidget {
  PesanMobile({Key? key}) : super(key: key);

  @override
  _PesanMobileState createState() => _PesanMobileState();
}

class _PesanMobileState extends State<PesanMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProvider<PDFApi>.withConsumer(
      viewModel: MyViewModel(),
      builder: (context, model, child) => Stack(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 20,
                value: model.downloadProgress,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Download file'),
                onPressed: () {
                  model.startDownloading();
                },
              ),
            ),
          ),
        ],
      ),
    );
    );
  }
}
