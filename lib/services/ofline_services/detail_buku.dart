// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learntera/services/ofline_services/buku.dart';
import 'package:learntera/services/online_services/lihat_pdf.dart';
import 'package:learntera/services/online_services/lihat_pdf_page.dart';
import 'package:learntera/theme/tema.dart';

class DetailBuku extends StatefulWidget {
  final Buku dataBuku;
  const DetailBuku({Key? key, required this.dataBuku}) : super(key: key);

  @override
  _DetailBukuState createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  @override
  Widget build(BuildContext context) {
    var lebarDevice = MediaQuery.of(context).size.width;
    var lebarContainer = lebarDevice - 250;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(children: [
                Container(
                  height: double.infinity,
                  width: 150,
                  color: warnaLightDark,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: lebarContainer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dataBuku.judulBuku,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: headerUtama1,
                        ),
                        Text(
                          widget.dataBuku.pengarang,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: headerUtama2,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_outline,
                              size: 20,
                            ),
                            Text(
                              widget.dataBuku.ratingBuku,
                              style: header2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: null,
                    child: Row(
                      children: [
                        Icon(Icons.star_outline),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Beri Rating"),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final url = '/semua buku/${widget.dataBuku.judulBuku}.pdf';
                      final file = await PDFApi.loadFirebase(url);
                      if (file == null) {
                        return showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("File Tidak Ditemukan"),
                            content: Text(
                                "file yang anda cari tidak bisa kami temukan mungkin ada kesalahan dalam server kami.\n\nbantu kami dengan mereport page atau buku yang tidak bisa ditampilkan pada halaman report bug\n\nkami akan berusaha sekuat tenaga agar buku yang direport segera ditampilkan"),
                          ),
                        );
                      } else {
                        bukaPdf(context, file);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.save_alt_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Simpan"),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      const url = 'pii.or.id';
                      final file = await PDFApi.loadNetwork(Uri.http(url, '/uploads/dummies.pdf'));
                      bukaPdf(context, file);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.read_more_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Baca"),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(widget.dataBuku.deskripsiBuku),
            // for (var i = 0; i < 50; i++) const Text("data")
          ],
        ),
      )),
    );
  }
}

void bukaPdf(BuildContext context, File file) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LihatPDFPage(file: file)));
