// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomePageLaptop extends StatefulWidget {
  HomePageLaptop({Key? key}) : super(key: key);

  @override
  _HomePageLaptopState createState() => _HomePageLaptopState();
}

class _HomePageLaptopState extends State<HomePageLaptop> {
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
              "HomePageLaptop",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
