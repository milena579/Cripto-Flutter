import 'package:flutter_application_1/moeda_card.dart';

import 'moeda.dart';

class Historico {
  DateTime dataOperacao;
  String tipoOperacao;
  Moeda moeda;
  double valor;
  double quantidade;

  Historico({
    required this.dataOperacao,
    required this.tipoOperacao,
    required this.moeda,
    required this.valor,
    required this.quantidade,
  });
}
