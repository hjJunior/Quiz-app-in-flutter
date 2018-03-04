import 'package:flutter/material.dart';
import '../utils/pergunta.dart';
import '../utils/quiz.dart';
import '../UI/botao_resposta.dart';
import '../UI/pergunta_titulo.dart';
import '../UI/resposta_overlay.dart';

import './resultados.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {

  Pergunta perguntaAtual;
  Quiz quiz = new Quiz([
    new Pergunta("Pizza é saudavel", false),
    new Pergunta("Este aplicativo é nativo", false),
    new Pergunta("Flutter é otimo", true)
  ]);

  String perguntaTexto;
  int numeroPergunta;
  bool eCorreto = true;
  bool overlayVisible = false;

  @override
  void initState(){
    super.initState();
    proximaPergunta(true);
  }

  void proximaPergunta(bool first) {
    perguntaAtual = quiz.proximaPergunta;

    if (quiz.length == numeroPergunta) {
      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new Resultados(quiz.placar, quiz.length)), (Route route) => route == null);
      return;
    }

    if (first) {
      perguntaTexto = perguntaAtual.pergunta;
      numeroPergunta = quiz.numeroPergunta;
    } else {
      this.setState(() {
        overlayVisible = false;
        numeroPergunta = quiz.numeroPergunta;
        perguntaTexto = perguntaAtual.pergunta;
      });
    }
  }

  void responder(bool resposta) {
    eCorreto = (perguntaAtual.resposta == resposta);
    quiz.responder(eCorreto);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // Esta e nossa pagina principal
          children: <Widget>[
            new BotaoResposta(true, () => responder(true)),
            new PerguntaTitulo(perguntaTexto, numeroPergunta),
            new BotaoResposta(false, () => responder(false))
          ],
        ),
        overlayVisible == true ? new RespostaOverlay(() => proximaPergunta(false), eCorreto) : new Container()
        // new RespostaOverlay(() => print('Oi'), eCorreto)
      ],
    );
  }
}