import 'package:flutter/material.dart';
import 'package:promocoes/classes/classes.dart';

class Funcoes {
  static calcularTamanhoTela(BuildContext context) {
    double largura = 0;
    largura = MediaQuery.of(context).size.width;
    switch (largura.toInt()) {
      case < 450:
        Globais.layout = Layout.mobile;
        break;
      case < 800:
        Globais.layout = Layout.smartphone;
        break;
      case < 1024:
        Globais.layout = Layout.tablet;
        break;
      case > 1024:
        Globais.layout = Layout.desktop;
        break;
      default:
        Globais.layout = Layout.desktop;
    }

    return largura;
    // print('Largura: ${MediaQuery.of(context).size.width}');
    // print('Altura: ${MediaQuery.of(context).size.height}');
  }
}
