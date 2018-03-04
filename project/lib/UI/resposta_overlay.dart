import 'dart:math';
import 'package:flutter/material.dart';

class RespostaOverlay extends StatefulWidget {

  final VoidCallback _onTap;
  final bool respostaCerta;

  RespostaOverlay(this._onTap, this.respostaCerta);

  @override
  State createState() => new RespostaOverlayState();
}

class RespostaOverlayState extends State<RespostaOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() => {}));
    _iconAnimationController.forward();
  }

  @override 
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * PI,
                child: new Icon(widget.respostaCerta ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0,),
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget.respostaCerta ? "Acerto!!" : "Resposta errada!", style: new TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      )
    );
  }
}