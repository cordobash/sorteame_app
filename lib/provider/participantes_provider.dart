import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider con todo lo relacionado a los participantes.
class ParticipanteProvider extends ChangeNotifier {
  List<String> _listaParticipantes = List.empty(growable: true);
  bool _eliminarPostSorteo = false;

  // Getters
  List<String> get listaParticipantes => _listaParticipantes;
  bool get eliminarPostSorteo => _eliminarPostSorteo;

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

// En este caso la lista de participantes no sera almacenada de forma permanente, asi en
// en ese caso solo queremos almacenar y cargar la configuracion del alertDialog a la hora de
// eliminar algun participante.
  cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _eliminarPostSorteo = prefs.getBool('key_elitodos') ?? false;
  }

  ParticipanteProvider() {
    cargarDatos();
  }
}
