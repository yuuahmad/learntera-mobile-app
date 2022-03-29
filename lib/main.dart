// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learntera/screen/authentifikasi/signin_page.dart';
import 'package:learntera/screen/home_page.dart';
import 'package:learntera/services/auth_services.dart';
import 'package:learntera/theme/tema.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PenggantiTema(ThemeData.dark())),
      Provider<AuthService>(create: (_) => AuthService(FirebaseAuth.instance)),
      StreamProvider(create: (context) => context.read<AuthService>().keadaanUser, initialData: null)
    ], child: MaterialDenganTema());
  }
}

class MaterialDenganTema extends StatelessWidget {
  const MaterialDenganTema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<PenggantiTema>(context);
    return MaterialApp(
      routes: {
        // '/semuaDevice': (context) => SemuaDevices(),
        // '/monitoring': (context) => Monitoring(),
        // '/caraPakai': (context) => CaraPakai(),
        // '/tentang': (context) => Tentang(),
        // '/pengaturan': (context) => Pengaturan(),
        // '/cobaFirestore': (context) => CobaFirebaseFirestore(),
        // '/mainFirestore': (context) => MainFirestore(),
        // '/signUp': (context) => SignUpPage(),
        // '/pengaturanAkun': (context) => PengaturanAkun(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Learntera App',
      theme: tema.dapatkanTemaSolo(),
      home: WraperAuth(),
    );
  }
}

class WraperAuth extends StatefulWidget {
  const WraperAuth({Key? key}) : super(key: key);
  @override
  _WraperAuthState createState() => _WraperAuthState();
}

class _WraperAuthState extends State<WraperAuth> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return HomePage();
    } else {
      return SignInPage();
    }
  }
}
