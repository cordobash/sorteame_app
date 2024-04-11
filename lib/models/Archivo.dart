import 'dart:io';
import 'package:app_sorteos/models/boxes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart';

class Archivo {
  String? _pathArchivo;
  String? _contenidoArchivo;
  String? _nombreArchivo;
  List<String> _nuevaLista = [];
  // Propiedades de la clase per que no tendran un getter como tal.
  List<int> _listaMayusculas = [];
  List<int> _listaMinusculas = [];
  List<int> _listaCaracteres = [];

  // Constructor por defecto.
  Archivo({required listaParticipantesActual}) {
    _generadorElementos(lista: _listaMayusculas, inicio: 65, fin: 90);
    _generadorElementos(lista: _listaMinusculas, inicio: 97, fin: 122);
    _listaCaracteres = [
      ..._listaMayusculas,
      ..._listaMinusculas,
      164,
      165,
    ];
    // Dado que se usara busqueda binaria sera necesario ordenar la lista de forma ascendente.
    _listaCaracteres.sort();
  }

  // Metodo para invocar al explordor de archivos de la plataforma.
  Future<void> abrirArchivo() async {
    String _rachaCadena = "";
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _pathArchivo = result.files.single.path!;
      File archivo = File(_pathArchivo!);
      _nombreArchivo = result.files.first.name;

      // El contenido del archivo ya estara encapsulado en esta siguiente variable.Asi que trabajaremos con esa variable.
      String contenido = await archivo.readAsString();

      // Recorreremos la cadena para empezar con las validaciones
      for (int i = 0; i < contenido.length; i++) {
        // llamamos al buscarElemento, el cual mediante la busquedaBinaria ira analizando el contenido.
        if (_buscarElemento(_listaCaracteres, contenido[i].codeUnitAt(0))) {
          _rachaCadena += contenido[i];
        } else {
          (_rachaCadena.isNotEmpty) ? _nuevaLista.add(_rachaCadena) : null;
          _rachaCadena = "";
        }
      }
      (_rachaCadena.isNotEmpty) ? _nuevaLista.add(_rachaCadena) : null;
      _rachaCadena = "";
      listaParticipantes += [..._nuevaLista];
    }
  }

  // Metodos
  bool _buscarElemento(lista, elemento) {
    int inicio = 0;
    int fin = lista.length - 1;
    while (inicio <= fin) {
      int medio = ((inicio + fin) / 2).floor();
      if (lista[medio] == elemento) {
        return true;
      }
      if (lista[medio] < elemento) {
        inicio = medio + 1;
      } else {
        fin = medio - 1;
      }
    }
    return false;
  }

  // Generamos un rango de numeros y se anade al arreglo indicado, con el fin de escribir menos codigoZ
  void _generadorElementos(
      {required List<dynamic> lista, required int inicio, required int fin}) {
    for (int valor = inicio; valor <= fin; valor++) {
      // Va anadiendo los numeros a la lista.
      lista.add(valor);
    }
  }

  // Getters
  String? getPathArchivo() {
    return _pathArchivo;
  }

  String? getContenidoArchivo() {
    return _contenidoArchivo;
  }

  String? getNombreArchivo() {
    return _nombreArchivo;
  }

  int? getLongitudNuevaLista() {
    return _nuevaLista.length;
  }
}
