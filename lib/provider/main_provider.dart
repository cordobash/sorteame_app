import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> guardarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('key_indicecolor', _indiceListaColores);
  }

  Future<void> cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _indiceListaColores = prefs.getInt('key_indicecolor') ?? 0;
    notifyListeners();
  }

  // Constructor
  MainProvider() {
    cargarDatos();
  }
}
