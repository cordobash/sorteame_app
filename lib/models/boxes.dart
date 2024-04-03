import 'package:hive/hive.dart';

// Variables globales
late Box boxSorteo;
// Checkbox
bool eliminarTodos = true;
bool activarAnimacion = true;
bool nombresDuplicados = false;
List<int> listaConteo = [3,5,7,10];
int cuentaRegresiva = listaConteo.first;
bool visibleFloating = true;
bool visibleFloatingAnteriores = (boxSorteo.isNotEmpty) ? true : false;

String? ganadorSorteo;
String? vTituloSorteo = ' ';

double? opacidadCuentaRegresiva = 1.0;