import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  late Color _colorGlobal;
  late int _indiceListaColores = 0;
  List<Color> _listaColores = [
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.purple
  ];

  // Getters
  // Color get colorGlobal => _colorGlobal;
  int get indiceListaColores => _indiceListaColores;
  Color get colorGlobal => _listaColores[indiceListaColores];

  // Setters
  cambiarIndice(int indice) {
    _indiceListaColores = indice;
    notifyListeners();
  }

  // Constructor
  MainProvider() {
    // _colorGlobal = _listaColores[_indiceListaColores];
  }
}
