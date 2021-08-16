import 'package:flutter/material.dart';

class Liberac {
  int status;
  String titulo;
  String descricao;
  String solicitante;
  String data;
  String hora;
  List<ItLiberac> itens;

  Liberac(
      {this.status,
      this.titulo,
      this.descricao,
      this.solicitante,
      this.data,
      this.hora,
      this.itens});

  Color getColorStatus() {
    if (status == 1) {
      return Colors.blue;
    }
    return Colors.red;
  }
}

class ItLiberac {
  String descricao;
  bool hValue;
  int quantidade;
  double valor;
}
