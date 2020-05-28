import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controllerCep = TextEditingController();
  String retornoCep;

  _recuperarCep() async {
    String cep = "13059010";
    String url = "http://viacep.com.br/ws/${controllerCep.text}/json";

    http.Response response;
    response = await http.get(url);

    setState(() {
      retornoCep = response.body;      
    });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo consumo de API"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: controllerCep,
            ),
            RaisedButton(
              child: Text("Clique aqui..."),
              onPressed: _recuperarCep,
            ),
            Text(retornoCep.toString()),
          ],
        ),
      ),
    );
  }
}
