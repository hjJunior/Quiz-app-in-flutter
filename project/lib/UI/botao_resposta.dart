import 'package:flutter/material.dart';


class BotaoResposta extends StatelessWidget {

  final bool _resposta;
  final VoidCallback _onTap;

  BotaoResposta(this._resposta, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material( // Botão negativo
      color: _resposta == false ? Colors.redAccent : Colors.greenAccent,
      child: new InkWell(
        onTap: () => _onTap(),
        child: new Center(
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.white, width: 5.0)
            ),
            padding: new EdgeInsets.all(20.0),
            child: new Text(_resposta == false ? "Falso" : "Verdadeiro",
              style: new TextStyle(color: Colors.white, fontSize: 40.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    ),
    );
  }
}
