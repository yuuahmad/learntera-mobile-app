// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class SignInPageTablet extends StatefulWidget {
  SignInPageTablet({Key? key}) : super(key: key);

  @override
  _SignInPageTabletState createState() => _SignInPageTabletState();
}

class _SignInPageTabletState extends State<SignInPageTablet> {
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
              "tablet sign in",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
