import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider con todo lo relacionado a los participantes.
class ParticipanteProvider extends ChangeNotifier {
  List<String> _listaParticipantes = List.empty(growable: true);
  bool _eliminarPostSorteo = false;
  bool _mostrarDialogoConfirmacion = true;

  // Getters
  List<String> get listaParticipantes => _listaParticipantes;
  bool get eliminarPostSorteo => _eliminarPostSorteo;
  bool get mostrarDialogoConfirmacion => _mostrarDialogoConfirmacion;

  // Metodos.
  agregarNuevoParticipante(String nuevoParticipante) {
    _listaParticipantes.add(nuevoParticipante);
    notifyListeners();
  }

  validarEliminarTodos() {
    if (_eliminarPostSorteo) {
      _listaParticipantes = [];
      notifyListeners();
    }
  }

  // Su unico uso sera en la parte main en el contenedor de participantes.
  eliminarTodosParticipantes() {
    _listaParticipantes = [];
    notifyListeners();
  }

  cambiarOpcionDialogo() {
    _mostrarDialogoConfirmacion = !_mostrarDialogoConfirmacion;
    guardarDatos();
    notifyListeners();
  }

  cambiarOpcionEliTodos() {
    _eliminarPostSorteo = !_eliminarPostSorteo;
    guardarDatos();
    notifyListeners();
  }

// En este caso la lista de participantes no sera almacenada de forma permanente, asi en
// en ese caso solo queremos almacenar y cargar la configuracion del alertDialog a la hora de
// eliminar algun participante, ademas del estado del checkbox para mostrar o no de nuevo el dialogo de confirmacion en editar_participante
  cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _eliminarPostSorteo = prefs.getBool('key_elitodos') ?? false;
    _mostrarDialogoConfirmacion = prefs.getBool('key_confirmacion') ?? false;
  }

  guardarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('key_elitodos', _eliminarPostSorteo);
    prefs.setBool('key_confirmacion', _mostrarDialogoConfirmacion);
  }

  ParticipanteProvider() {
    cargarDatos();
  }
}
