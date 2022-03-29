// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class SignInPageLaptop extends StatefulWidget {
  SignInPageLaptop({Key? key}) : super(key: key);

  @override
  _SignInPageLaptopState createState() => _SignInPageLaptopState();
}

class _SignInPageLaptopState extends State<SignInPageLaptop> {
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
              "laptop sign in",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
