import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Logout'),
            ),
            SizedBox(height: 16), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/transferencia');
              },
              child: Text('Transferência'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/cotacao');
              },
              child: Text('Cotação'),
            ),
          ],
        ),
      ),
    );
  }
}
