// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/theme/tema.dart';
import 'package:provider/provider.dart';

class SignInPageMobile extends StatefulWidget {
  SignInPageMobile({Key? key}) : super(key: key);

  @override
  _SignInPageMobileState createState() => _SignInPageMobileState();
}

class _SignInPageMobileState extends State<SignInPageMobile> {
  final TextEditingController _emailPengguna = TextEditingController();
  final TextEditingController _passPengguna = TextEditingController();
  // ini untuk validasi data
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailPengguna.dispose();
    _passPengguna.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const urlimage = 'images/app/learntera round small.png';
    const urlimageitera = 'images/app/logo itera.png';
    AuthService _authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(urlimage),
                    height: 100,
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "x",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Image(
                    image: AssetImage(urlimageitera),
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: TextFormField(
                      autofillHints: [AutofillHints.email],
                      validator: (email) {
                        RegExp regex = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.itera.ac.id");
                        if (email == '') {
                          return "E-mail tidak boleh kosong";
                        } else {
                          if (!regex.hasMatch(email!)) {
                            return 'Bukan E-mail ITERA';
                          } else {
                            return null;
                          }
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailPengguna,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: warnaLightDark, width: 2.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: warnaButtonSampingan, width: 2.0),
                        ),
                        icon: Icon(
                          Icons.email_outlined,
                          color: warnaButtonUtama,
                        ),
                        hintText: "e-mail ITERA",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: TextFormField(
                      validator: (pass) {
                        if (pass == '') {
                          return "harap masukkan password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: warnaLightDark, width: 2.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: warnaButtonSampingan, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.key_outlined,
                            color: warnaButtonUtama,
                          ),
                          hintText: "password"),
                      controller: _passPengguna,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(warnaButtonSampingan),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Cara Login Learntera?"),
                          content: Text(
                              "gunakan akun itera untuk masuk ke learntera.\n\ncara mendapatkan akun itera adalah dengan menjadi mahasiswa itera\n\njika tidak bisa masuk walaupun sudah memiliki akun itera, dapat menghubungi admin di No.WA 08988927565"),
                        ),
                      );
                    },
                    child: Text(
                      "Bantuan",
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(warnaButtonUtama),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                title: Text("Masuk Learntera..."),
                                content: FutureBuilder(
                                    future: _authService.masukApp(
                                        inputemail: _emailPengguna.text.trim().toString(),
                                        inputpass: _passPengguna.text.trim().toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.done) {
                                        return Text(snapshot.data.toString());
                                      } else {
                                        return CircularProgressIndicator(
                                          color: warnaButtonUtama,
                                        );
                                      }
                                    })));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text("Terjadi Kesalahan"),
                                  content: Text(
                                      "tidak dapat mengupload data user karena alasan yang belum diketahui. pastikan data yang anda masukkan sudah benar"),
                                ));
                      }
                    },
                    child: Text(
                      "Masuk Akun",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// gunakan ini kalau nanti sudah beres kalau belum, jangan digunakan
class RoundedFormField extends StatefulWidget {
  final Widget child;
  const RoundedFormField({Key? key, required this.child}) : super(key: key);

  @override
  State<RoundedFormField> createState() => _RoundedFormFieldState();
}

class _RoundedFormFieldState extends State<RoundedFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: warnaUtamaAtas),
      child: widget.child,
    );
  }
}
