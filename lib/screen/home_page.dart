// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learntera/screen/laptop/home_page_laptop.dart';
import 'package:learntera/screen/mobile/home_page_mobile.dart';
import 'package:learntera/screen/tablet/home_page_tablet.dart';
import 'package:learntera/theme/responsive_layout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobileBody: HomePageMobile(), tabletBody: HomePageTablet(), latopBody: HomePageLaptop()),
    );
  }
}
