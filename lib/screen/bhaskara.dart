import 'package:flutter/material.dart';

class Bhaskara extends StatefulWidget {
  @override
  BhaskaraState createState() => BhaskaraState();
}

class BhaskaraState extends State<Bhaskara> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _teste1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calc Bhaskara"),
      ),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Insira os Valores pedidos',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('A: '),
                  TextField(
                    controller: _teste1,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Insira o Valor de A',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('B: '),
                  // TextField(
                  //   controller: _aController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Insira o Valor de A',
                  //   ),
                  //   style: TextStyle(
                  //     fontSize: 24.0,
                  //   ),
                  //   keyboardType: TextInputType.number,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('C: '),
                  // TextField(
                  //   controller: _aController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Insira o Valor de A',
                  //   ),
                  //   style: TextStyle(
                  //     fontSize: 24.0,
                  //   ),
                  //   keyboardType: TextInputType.number,
                  // ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RaisedButton(
                      child: Text('Calcular'),
                      onPressed: () => _teste(),
                  ),
                ),
                RaisedButton(child: Text('Limpar'),
                    onPressed: () => _teste(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _teste() {}
