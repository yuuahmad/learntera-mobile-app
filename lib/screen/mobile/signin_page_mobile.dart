// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:provider/provider.dart';

class SignInPageMobile extends StatefulWidget {
  SignInPageMobile({Key? key}) : super(key: key);

  @override
  _SignInPageMobileState createState() => _SignInPageMobileState();
}

class _SignInPageMobileState extends State<SignInPageMobile> {
  final TextEditingController _emailPengguna = TextEditingController();
  final TextEditingController _passPengguna = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService _authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: Text("sign in page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "mobile sign in",
              style: TextStyle(fontSize: 40),
            ),
            TextFormField(
              controller: _emailPengguna,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: _passPengguna,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  print(_authService.masukApp(
                      inputemail: _emailPengguna.text.trim().toString(),
                      inputpass: _passPengguna.text.trim().toString()));
                },
                child: Text("masuk akun"))
          ],
        ),
      ),
    );
  }
}
