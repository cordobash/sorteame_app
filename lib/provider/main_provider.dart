import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  late int _indiceListaColores = 0;
  List<Color> _listaColores = [
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.purple
  ];

  List<Color> _gradiente = [];
  // Getters
  // Color get colorGlobal => _colorGlobal;
  int get indiceListaColores => _indiceListaColores;
  dynamic get colorGlobal => _listaColores[indiceListaColores];
  List<dynamic> get gradiente => obtenerGradiente();

  // Setters
  cambiarIndice(int indice) {
    _indiceListaColores = indice;
    notifyListeners();
  }

  obtenerGradiente() {
    return [
      colorGlobal,
      colorGlobal.shade400,
      colorGlobal.shade500,
      colorGlobal.shade600,
      colorGlobal.shade900
    ];
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
