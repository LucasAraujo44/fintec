import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Transferência',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransferScreen(),
    );
  }
}

class TransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizar transferência'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: Text('Voltar para menu principal'),
            ),
            SizedBox(height: 16), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/transferencia');
              },
              child: Text('Transferir'),
            ),
          ],
        ),
      ),
    );
  }
}
