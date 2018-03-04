import 'package:flutter/material.dart';

import './landing.dart';

class Resultados extends StatelessWidget {

  final int _placar;
  final int _totalPerguntas;

  Resultados(this._placar, this._totalPerguntas);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Seu Placar: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(_placar.toString() + "/" + _totalPerguntas.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new Landing()), (Route route) => route == null)
          )
        ],
      ),
    );
  }
}