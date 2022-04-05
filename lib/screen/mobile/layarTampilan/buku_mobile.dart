// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/services/dapatkan_buku.dart';
import 'package:learntera/services/ofline_services/buku.dart';
import 'package:learntera/services/ofline_services/detail_buku.dart';
import 'package:learntera/theme/tema.dart';
import 'package:provider/provider.dart';

class BukuMobile extends StatefulWidget {
  BukuMobile({Key? key}) : super(key: key);

  @override
  _BukuMobileState createState() => _BukuMobileState();
}

class _BukuMobileState extends State<BukuMobile> {
  // percobaan print data dari class DapatkanBuku
  var dataFirestoreBuku = DapatkanBuku();
  // gunakan servis firestore untuk data yang ada disini.
  // dan gunakan sebaik mungkin
  // final buku = List<Buku>.generate(
  //   10,
  //   (i) => Buku(
  //       judulBuku: "cinta buta $i",
  //       ratingBuku: (i * 2 + 3).toString(),
  //       deskripsiBuku:
  //           "ini buku ke $i dengan rating ${i * 2 + 3} yang sangat $i pokoknya kamu harus $i karena ini deskripsi, saya harus membuatnya sangat panjang karena saya tidak ingin kalian merasa kecewa karenanya"),
  // );
  @override
  Widget build(BuildContext context) {
    var lebarDevice = MediaQuery.of(context).size.width;
    var lebarContainer = lebarDevice - 230;
    DapatkanBuku _dapatkanBuku = Provider.of<DapatkanBuku>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.add_outlined,
          size: 30,
        ),
      ),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.sort_outlined,
            color: warnaDark,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.bookmark_outline,
            color: warnaDark,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search_outlined,
            color: warnaDark,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: warnaUtama,
        title: Text(
          "B O O K S",
          style: headerUtama1dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            CardKelompokBuku(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "Buku Terbaru",
                    textAlign: TextAlign.start,
                    style: headerUtama1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: lebarContainer),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1.5,
                color: Colors.black38,
              ),
            ),
            // data dari firestore
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('buku')
                  .limit(7)
                  .orderBy('buku_ke', descending: true)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                var datapenting = snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return CardbukuTerbaru(
                    aksiKetikaDitekan: () {
                      Buku bukuFirestore = Buku(
                          judulBuku: data['judul_buku'] ?? "tanpa nama",
                          ratingBuku: data['rating_buku'] ?? "0",
                          deskripsiBuku: data['deskripsi_buku'] ?? "tidak ada deskripsi",
                          pengarang: data['pengarang'] ?? 'pengarang tidak diketahui');
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => DetailBuku(dataBuku: bukuFirestore)));
                    },
                    namaBuku: data['judul_buku'] ?? 'tanpa nama',
                    rating: data['rating_buku'] ?? '0',
                    deskripsiBuku: data['deskripsi_buku'] ?? 'tidak ada deskripsi',
                  );
                }).toList();
                return Column(
                  children: datapenting,
                );
              },
            ),
            CardKelompokBuku()

            // for (var i = 0; i < 7; i++)
            //   CardbukuTerbaru(
            //     aksiKetikaDitekan: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBuku(dataBuku: buku[i])));
            //     },
            //     namaBuku: buku[i].judulBuku,
            //     rating: buku[i].ratingBuku,
            //     deskripsiBuku: buku[i].deskripsiBuku,
            //   ),
          ],
        ),
      ),
    );
  }
}

class CardbukuTerbaru extends StatefulWidget {
  final void Function()? aksiKetikaDitekan;
  String namaBuku;
  String deskripsiBuku;
  String rating;
  CardbukuTerbaru(
      {Key? key, required this.namaBuku, required this.deskripsiBuku, required this.rating, this.aksiKetikaDitekan})
      : super(key: key);

  @override
  _CardbukuTerbaruState createState() => _CardbukuTerbaruState();
}

class _CardbukuTerbaruState extends State<CardbukuTerbaru> {
  @override
  Widget build(BuildContext context) {
    var lebarDevice = MediaQuery.of(context).size.width;
    var lebarContainer = lebarDevice - 190;
    return GestureDetector(
      onTap: widget.aksiKetikaDitekan,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: warnaKedua),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: warnaLightDark),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: lebarContainer,
                  child: Text(
                    widget.namaBuku,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [Icon(Icons.star_outline), Text(widget.rating)],
                ),
                SizedBox(
                    height: 100,
                    width: lebarContainer,
                    child: Text(
                      widget.deskripsiBuku,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CardKelompokBuku extends StatefulWidget {
  CardKelompokBuku({Key? key}) : super(key: key);

  @override
  _CardKelompokBukuState createState() => _CardKelompokBukuState();
}

class _CardKelompokBukuState extends State<CardKelompokBuku> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Buku Paling Populer",
            style: headerUtama2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1.5,
            color: Colors.black38,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [for (var i = 0; i < 20; i++) CardBuku()],
          ),
        )
      ]),
    );
  }
}

class CardBuku extends StatefulWidget {
  const CardBuku({Key? key}) : super(key: key);

  @override
  State<CardBuku> createState() => _CardBukuState();
}

class _CardBukuState extends State<CardBuku> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 20,
      width: 20,
      color: warnaLightDark,
    );
  }
}
