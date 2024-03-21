import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

// Variables globales
late Box boxSorteo;
// Checkbox
bool eliminarTodos = true;
bool activarAnimacion = true;
bool nombresDuplicados = false;
ThemeData tema = ThemeData.light();
int cuentaRegresiva = 3;
String? ganadorSorteo;
String? vTituloSorteo = ' ';