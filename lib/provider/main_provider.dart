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
  int _indiceEnumIdioma = 0;
  late Locale _locale;

  // Getters
  int get indiceListaColores => _indiceListaColores;
  dynamic get colorGlobal => _listaColores[indiceListaColores];
  List<dynamic> get gradiente => obtenerGradiente();
  int get indiceEnumIdioma => _indiceEnumIdioma;

  // Setters
  // 0 - 5
  cambiarIndice(int indice) {
    _indiceListaColores = indice;
    notifyListeners();
  }

  // 0 - 1
  cambiarIdioma(int indice) {
    _indiceEnumIdioma = indice;
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
    prefs.setInt('key_Idioma', _indiceEnumIdioma);
  }

  Future<void> cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _indiceListaColores = prefs.getInt('key_indicecolor') ?? 0;
    print('Indice de color: $_indiceListaColores');
    _indiceEnumIdioma = prefs.getInt('key_Idioma') ?? 0;
    print('Indice de idioma: $_indiceEnumIdioma');
    notifyListeners();
  }

  // Constructor
  MainProvider() {
    // Carga el contenido de las preferencias.
    cargarDatos();
  }
}
