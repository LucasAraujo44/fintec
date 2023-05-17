// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja bem vindo ao Fintech'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Faça seu Login',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
            ),
          ],
        ),
      ),
    );
  }
}
