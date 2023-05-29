// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'login.dart';
import 'principalTela.dart';
import 'transferencia.dart';
import 'cotacao.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/transferencia': (context) => TransferScreen(),
        '/cotacao': (context) => MyHomePage()
      },
    );
  }
}
