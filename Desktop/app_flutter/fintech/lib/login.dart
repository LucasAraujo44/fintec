// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Screen',
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
