// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/tema.dart';

class HomePageDenganDarkMode extends StatefulWidget {
  const HomePageDenganDarkMode({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePageDenganDarkMode> createState() => _HomePageDenganDarkModeState();
}

class _HomePageDenganDarkModeState extends State<HomePageDenganDarkMode> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // buat privat variable bernama "_penggantiTema" dengan mengacu pada provider Pengganti tema
    PenggantiTema _penggantiTema = Provider.of<PenggantiTema>(context);
    final _pengaturIcon = context.watch<PenggantiTema>().dapatkanApakahGelap();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // ini adalah contoh menerapkan tema pada teks
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
                onPressed: () {
                  _penggantiTema.setelTemaSolo();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("gati tema"),
                    SizedBox(
                      width: 40,
                    ),
                    _pengaturIcon
                        ? Icon(
                            Icons.toggle_off,
                            size: 40,
                          )
                        : Icon(
                            Icons.toggle_on,
                            size: 40,
                          )
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
