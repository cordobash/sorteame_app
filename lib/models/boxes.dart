import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

List<Color> listaColores = [
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.blue,
  Colors.green,
  Colors.purple
];

// Variables globales
late Box boxSorteo;
List<String> listaParticipantes = List.empty(growable: true);

// Checkbox
bool eliminarTodos = true;
bool activarAnimacion = true;
bool nombresDuplicados = true;
bool mostrarDialogoConfirmacion = true;
int indiceEnumIdiomas = 0;
int indiceListaColores = 0;
int indiceListaConteo = listaConteo.first;
List<int> listaConteo = [5, 7, 10, 15, 30, 3];
bool visibleFloatingAnteriores = (boxSorteo.isNotEmpty) ? true : false;
String? ganadorSorteo;
String vTituloSorteo = '';
double? opacidadCuentaRegresiva = 1.0;
// dynamic colorGlobal;
