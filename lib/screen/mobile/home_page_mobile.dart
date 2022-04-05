// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:learntera/screen/mobile/layarTampilan/buku_mobile.dart';
import 'package:learntera/screen/mobile/layarTampilan/kelas_mobile.dart';
import 'package:learntera/screen/mobile/layarTampilan/pesan_mobile.dart';
import 'package:learntera/screen/mobile/layarTampilan/saya_mobile.dart';
import 'package:learntera/screen/mobile/layarTampilan/story_mobile.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomePageMobile extends StatefulWidget {
  HomePageMobile({Key? key}) : super(key: key);

  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  int indexSekarang = 0;
  final layarTampilan = [PesanMobile(), BukuMobile(), StoryMobile(), KelasMobile(), SayaMobile()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromARGB(255, 236, 237, 237),
              currentIndex: indexSekarang,
              onTap: (index) => setState(() => indexSekarang = index),
              selectedIconTheme: IconThemeData(size: 25),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.message_outlined), label: "pesan", activeIcon: Icon(Icons.message)),
                BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: "buku", activeIcon: Icon(Icons.book)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.watch_later_outlined), label: "story", activeIcon: Icon(Icons.watch_later)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_tree_outlined), label: "kelas", activeIcon: Icon(Icons.account_tree)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: "saya", activeIcon: Icon(Icons.person)),
              ]),
          body: layarTampilan[indexSekarang]),
    );
  }
}
