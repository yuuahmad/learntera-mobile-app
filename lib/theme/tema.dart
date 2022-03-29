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
        primaryColor: Color.fromARGB(255, 192, 161, 67),
        scaffoldBackgroundColor: Color.fromARGB(255, 236, 236, 236),
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
