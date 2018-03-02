import './pergunta.dart';

class Quiz {
  List<Pergunta> _perguntas;
  int _perguntaAtualIndex = -1;
  int _placar = 0;

  Quiz(this._perguntas) {
    _perguntas.shuffle(); // Muda a ordem do array
  }

  // Getters
  List<Pergunta> get perguntas => _perguntas;
  int get length => _perguntas.length;
  int get numeroPergunta => _perguntaAtualIndex+1;
  int get placar => _placar;

  Pergunta get proximaPergunta {
    // Avançar o indice da pergunta atual
    _perguntaAtualIndex++;
    // Caso o indice seja maior que o tanto de perguntas retornar q não existe a proxima pergunta
    if (_perguntaAtualIndex >= length) return null;
    // Caso contrario, retornar a proxima pergunta 
    return _perguntas[_perguntaAtualIndex];
  }

  void responder (bool estaCorreto) {
    // Caso a pergunta estiver correta aumentar o placar...
    if (estaCorreto) _placar++;
  }
}