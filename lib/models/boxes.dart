import 'package:hive/hive.dart';

// Variables globales
late Box boxSorteo;
// Checkbox
bool eliminarTodos = true;
bool activarAnimacion = true;
bool nombresDuplicados = false;
List<int> listaConteo = [3,5,7,10];
int cuentaRegresiva = listaConteo.first;

String? ganadorSorteo;
String? vTituloSorteo = ' ';