// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/theme/tema.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SayaMobile extends StatefulWidget {
  SayaMobile({Key? key}) : super(key: key);

  @override
  _SayaMobileState createState() => _SayaMobileState();
}

class _SayaMobileState extends State<SayaMobile> {
  @override
  Widget build(BuildContext context) {
    firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/me.jpg');

    final firebaseUser = context.watch<User?>();
    String? namaUser = firebaseUser?.displayName;
    String? uidUser = firebaseUser?.uid;
    String? fotoUser = firebaseUser?.photoURL;

    Future<String> downloadURLExample() async {
      try {
        String downloadURL = await firebase_storage.FirebaseStorage.instance.ref('/me.jpg').getDownloadURL();
        print(downloadURL);
        return downloadURL;
      } catch (e) {
        print("terjadi kesalahan: $e");
        return "terjadi kesalahan: $e";
      }
      // Within your widgets:
      // Image.network(downloadURL);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              FutureBuilder(
                  future: downloadURLExample(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("terjadi kesalahan");
                    }
                    return Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      child: ClipOval(
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            snapshot.data.toString(),
                            fit: BoxFit.fitWidth,
                          )),
                    );
                  }),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "ahmad yusuf maulana",
                  style: headerUtama1,
                ),
                Text(
                  "user uid : 111j11kjk2ksa",
                  style: headerUtama2,
                )
              ])
            ]),
            // TODO: buat menu pilihan pengaturan sesuai dengan ketentuan di figma
            // ini dan setelahnya adalah menu pengaturan
            Container(
              // margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("pengaturan akun"),
                  Divider(thickness: 1.5),
                  ListTileSaya(
                    judulListtile: "tentang saya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "ubah profil",
                    ikonListtile: Icons.pending_actions_rounded,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "notifikasi",
                    ikonListtile: Icons.notifications_active_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "privasi",
                    ikonListtile: Icons.privacy_tip_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("pengaturan aplikasi"),
                  Divider(thickness: 1.5),
                  ListTileSaya(
                    judulListtile: "laporkan masalah aplikasi",
                    ikonListtile: Icons.bug_report_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "beri rating",
                    ikonListtile: Icons.star_border_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.info_outline,
                    aksiKetikaDitekan: null,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("pengaturan lainnya"),
                  Divider(thickness: 1.5),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  ListTileSaya(
                    judulListtile: "pengaturan lainnya",
                    ikonListtile: Icons.person_search_outlined,
                    aksiKetikaDitekan: null,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  ListTileSaya(
                      judulListtile: "keluar akun",
                      ikonListtile: Icons.outbond_outlined,
                      aksiKetikaDitekan: () {
                        context.read<AuthService>().keluar();
                      }),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: warnaKedua,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileSaya extends StatelessWidget {
  final String judulListtile;
  final IconData ikonListtile;
  final void Function()? aksiKetikaDitekan;

  const ListTileSaya({Key? key, required this.judulListtile, required this.ikonListtile, this.aksiKetikaDitekan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        title: Text(
          judulListtile,
          style: header1,
        ),
        leading: Icon(
          ikonListtile,
          size: 25,
        ),
        onTap: aksiKetikaDitekan);
  }
}
