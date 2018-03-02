import 'package:flutter/material.dart';

class PerguntaTitulo extends StatefulWidget {

  final String _pergunta;
  final int _numeroPergunta;

  PerguntaTitulo(this._pergunta, this._numeroPergunta);

  @override
  State createState() => new PerguntaTituloState();
}

class PerguntaTituloState extends State<PerguntaTitulo> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.ease);
    _fontSizeAnimation.addListener(() => this.setState(() {}));    
    _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
        child: new Center(
          child: new Text(widget._numeroPergunta.toString() + ": " + widget._pergunta, 
            style: new TextStyle(fontSize: (_fontSizeAnimation.value != null) ? _fontSizeAnimation.value * 20 : 15.0),),
        ),
      )
    );
  }
}