// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';

// buat kelas bernama pengganti tema
class PenggantiTema extends ChangeNotifier {
  // buat variable untuk menunjukkan apakah temanya terang atau gelap
  //// ini buatan sendiri ////
  static bool _apakahGelap = false;
  // buat private variabel dengan tipe data "ThemeData"
  ThemeData _themeData;
  // konstruktor "PenggantiTema"
  PenggantiTema(this._themeData);
  // getter untuk mendapatkan tema solo mode dan mendapatkan nilai boolean "_apakahGelap"
  //// ini buatan sendiri ////
  dapatkanTemaSolo() => _apakahGelap ? _themeData = KustomTema.temaGelap : KustomTema.temaTerang;
  dapatkanApakahGelap() => _apakahGelap;
  // buat setter "setelTemaSolo"
  //// ini buatan sendiri ////
  setelTemaSolo() {
    _apakahGelap = !_apakahGelap;
    notifyListeners();
  }
}

class KustomTema {
  static ThemeData get temaTerang {
    return ThemeData(
        primaryColor: Color.fromARGB(255, 240, 229, 208),
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 229, 208),
        // komen dulu, karena saya ngak tahu gimana cara pakainya
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w400),
        //   headline6: TextStyle(fontSize: 20, color: Colors.black),
        //   bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
        // ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.amber,
        ));
  }

  static ThemeData get temaGelap {
    return ThemeData(
        primaryColor: Color.fromARGB(255, 192, 161, 67),
        scaffoldBackgroundColor: Color.fromARGB(255, 39, 39, 39),
        fontFamily: 'Montserrat',
        // komen dulu, karena saya ngak tahu gimana cara pakainya
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),
        //   headline6: TextStyle(fontSize: 20, color: Colors.white),
        //   bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
        // ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.amberAccent,
        ));
  }
}

// tema untuk warna
Color warnaUtama = Color.fromARGB(255, 240, 229, 208);
Color warnaKedua = Color.fromARGB(255, 255, 250, 240);
Color warnaUtamaAtas = Color.fromARGB(255, 255, 204, 106);
Color warnaButtonUtama = Color.fromARGB(255, 198, 84, 32);
Color warnaButtonSampingan = Color.fromARGB(255, 164, 139, 127);

Color warnaDark = Color.fromARGB(255, 31, 31, 31);
Color warnaLightDark = Color.fromARGB(255, 92, 78, 71);

// tema untuk teks utama dan sekunder
TextStyle headerUtamaaa = TextStyle(fontSize: 28, fontWeight: FontWeight.w400);
TextStyle headerUtama1 = TextStyle(fontSize: 25, fontWeight: FontWeight.w400);
TextStyle headerUtama1dark = TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black87);
TextStyle headerUtama2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
TextStyle header1 = TextStyle(fontSize: 20);
TextStyle header2 = TextStyle(fontSize: 16);

// ini adalah tema untuk button
// class MainButton extends StatelessWidget {
//   const MainButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
