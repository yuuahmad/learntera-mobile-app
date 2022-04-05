// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/theme/tema.dart';
import 'package:provider/provider.dart';

class StoryMobile extends StatefulWidget {
  StoryMobile({Key? key}) : super(key: key);

  @override
  _StoryMobileState createState() => _StoryMobileState();
}

class _StoryMobileState extends State<StoryMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add_outlined),
      ),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            color: warnaDark,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.add_box_outlined,
            color: warnaDark,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
        backgroundColor: warnaUtama,
        title: Text(
          "L E A R N T E R A",
          style: headerUtama1dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [for (var i = 0; i < 20; i++) Text("data   ")],
                ),
              ),
            ),
            // ini adaalh container untuk buku terbaru
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    color: warnaKedua),
                child: Column(
                  children: [for (var i = 0; i < 100; i++) Text("data")],
                )),
          ],
        ),
      ),
    );
  }
}
