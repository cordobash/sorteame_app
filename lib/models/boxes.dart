import 'package:hive/hive.dart';

// Variables globales
late Box boxSorteo;
List<String> listaParticipantes = List.empty(growable: true);

// Checkbox
bool eliminarTodos = true;
bool activarAnimacion = true;
bool nombresDuplicados = true;
bool mostrarDialogoConfirmacion = true;
List<int> listaConteo = [5, 7, 10, 15, 30, 3];
int cuentaRegresiva = listaConteo.first;
bool visibleFloatingAnteriores = (boxSorteo.isNotEmpty) ? true : false;
String? ganadorSorteo;
String vTituloSorteo = '';
double? opacidadCuentaRegresiva = 1.0;
late dynamic colorGlobal;
