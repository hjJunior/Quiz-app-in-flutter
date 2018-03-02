import 'package:flutter/material.dart';
import '../utils/pergunta.dart';
import '../utils/quiz.dart';
import '../UI/botao_resposta.dart';
import '../UI/pergunta_titulo.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Column( // Esta e nossa pagina principal
          children: <Widget>[
            new BotaoResposta(true, () => print("True")),
            new PerguntaTitulo("Pizza é a melhor coisa do mundo", 1),
            new BotaoResposta(false, () => print("False"))
          ],
        )
      ],
    );
  }
}