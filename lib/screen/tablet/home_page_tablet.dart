// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomePageTablet extends StatefulWidget {
  HomePageTablet({Key? key}) : super(key: key);

  @override
  _HomePageTabletState createState() => _HomePageTabletState();
}

class _HomePageTabletState extends State<HomePageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sign in page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "HomePageTablet",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
