// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class KelasMobile extends StatefulWidget {
  KelasMobile({Key? key}) : super(key: key);

  @override
  _KelasMobileState createState() => _KelasMobileState();
}

class _KelasMobileState extends State<KelasMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "KelasMobile",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
