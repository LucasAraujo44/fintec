import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    home: const MyHomePage(),
    theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.white),
  ));
}

Future<Map> getData() async {
  var url =
      Uri.parse('https://api.hgbrasil.com/finance?format=json&key=b6440bce');
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  // final clearController = TextEditingController();
  double dolar = 0.0;
  double euro = 0.0;

  VoidCallback? _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  VoidCallback? _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  VoidCallback? _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _clearFields() {
    realController.clear();
    dolarController.clear();
    euroController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Conversor de moeda"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ), // AppBar

        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                      child: Text(
                    "Aguarde...",
                    style: TextStyle(color: Colors.blue, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ));

                default:
                  if (snapshot.hasError) {
                    String? erro = snapshot.error.toString();
                    return Center(
                        child: Text(
                      "Ops, houve uma falha ao buscar os dados : $erro",
                      style:
                          const TextStyle(color: Colors.blue, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
                  } else {
                    dolar =
                        snapshot.data!["results"]["currencies"]["USD"]["buy"];
                    euro =
                        snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Icon(Icons.attach_money,
                              size: 180.0, color: Colors.blue),
                          campoTexto(
                              "Reais", "R\$ ", realController, _realChanged),
                          const Divider(),
                          campoTexto(
                              "Euros", "€ ", euroController, _euroChanged),
                          const Divider(),
                          campoTexto("Dólares", "US\$ ", dolarController,
                              _dolarChanged),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: _clearFields,
                            child: Text('Consultar novamente'),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/main');
                            },
                            child: Text('Voltar para menu inicial'),
                          ),
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}

Widget campoTexto(
    String label, String prefix, TextEditingController c, Function? f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blue),
        border: const OutlineInputBorder(),
        prefixText: prefix),
    style: const TextStyle(color: Colors.blue, fontSize: 25.0),
    onChanged: (value) => {f!(value)},
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}
