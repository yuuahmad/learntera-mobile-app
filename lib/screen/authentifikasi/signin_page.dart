// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/screen/laptop/signin_page_laptop.dart';
import 'package:learntera/screen/mobile/signin_page_mobile.dart';
import 'package:learntera/screen/tablet/signin_page_tablet.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/theme/responsive_layout.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      latopBody: SignInPageLaptop(),
      tabletBody: SignInPageTablet(),
      mobileBody: SignInPageMobile(),
    );
  }
}
