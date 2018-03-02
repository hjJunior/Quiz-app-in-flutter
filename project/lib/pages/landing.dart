import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => print("We tappped the page!"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Minha primeira página", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("Precione para continuar (em breve)", style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}