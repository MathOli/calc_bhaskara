import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calc_bhaskara/componets/contas.dart';
import 'dart:math';

Contas contas = new Contas();

String msgDelta;
String msgX1;
String msgX2;
String msgRaiz;

class Bhaskara extends StatefulWidget {
  @override
  BhaskaraState createState() => BhaskaraState();
}

class BhaskaraState extends State<Bhaskara> {

  FocusNode myFocusNode;

  @override
  void initState(){
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose(){
    myFocusNode.dispose();
    super.dispose();
  }


  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _teste1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Calc Bhaskara"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Insira os Valores pedidos',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _aController,
                autofocus: true,
                focusNode: myFocusNode,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo)
                  ),
                  hintText: 'Digite um numero',
                  labelText: 'Valor de A',
                  counterText: "",
                ),
                maxLength: 3,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _bController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo)
                  ),
                  hintText: 'Digite um numero',
                  labelText: 'Valor de B',
                  counterText: "",
                ),
                maxLength: 3,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _cController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo)
                  ),
                  hintText: 'Digite um numero',
                  labelText: 'Valor de C',
                  counterText: "",
                ),
                maxLength: 3,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RaisedButton(
                    child: Text('Calcular'),
                    onPressed: () => _calc(_aController.text,_bController.text,_cController.text),
                  ),
                ),
                RaisedButton(
                  child: Text('Limpar'),
                  onPressed: () => _novo(),
                ),
              ],
            ),
            Text(
              msgDelta,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Text(
              msgX1,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Text(
              msgX2,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Text(
              msgRaiz,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _novo(){
    FocusScope.of(context).requestFocus(myFocusNode);

    setState((){
      _aController.text = "";
      _bController.text = "";
      _cController.text = "";

      msgX2 = "";
      msgDelta = "";
      msgX1 = "";

      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }

  void _calc(String a, String b, String c) {
    setState(() {
      double x1;
      double x2;

      double vA = double.tryParse(a);
      double vB = double.tryParse(b);
      double vC = double.tryParse(c);

      double delta;

      if(vA == null || vB == null || vC == null){
        int flt;
        List valores = [vA,vB,vC];
        for(int i = 0; i<=valores.length;i++){
          if(valores[i] == null){
            flt++;
          }
        }
        msgDelta = 'Falta $flt valores';
      }else{
        delta = contas.delta(vA,vB,vC);

        if(delta < 0){
          msgDelta = "Delta: $delta";
          msgRaiz = "Não existem raízes reais";
        }else{
          x1 = contas.bhaskara1(vA, vB, delta);
          x2 = contas.bhaskara2(vA, vB, delta);

          x1.roundToDouble();
          x2.round();

          msgDelta = "Delta: $delta";
          msgX1 = "X¹: $x1";
          msgX2 = "X²: $x2";
        }
      }



      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });

  }
}