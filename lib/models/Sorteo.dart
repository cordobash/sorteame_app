import 'package:hive/hive.dart';
part 'Sorteo.g.dart';

@HiveType(typeId: 1)
class Sorteo {
  @HiveField(0)
  String? _tituloSorteo;

  @HiveField(1)
  String? _ganadorSorteo;

  @HiveField(2)
  int? _cantidadParticipantes;

  @HiveField(3)
  DateTime? _fechaRealizacion;

  // Constructor por defecto
  Sorteo();
  Sorteo.conDatos(
      {required tituloSorteo,
      required ganadorSorteo,
      required cantParticipantes}) {
    this._tituloSorteo = tituloSorteo;
    this._ganadorSorteo = ganadorSorteo;
    this._cantidadParticipantes = cantParticipantes;
    this._fechaRealizacion = DateTime.now();
  }

  // Getters
  String? getTitulo() {
    return _tituloSorteo;
  }

  String? getGanador() {
    return _ganadorSorteo;
  }

  int? getCantParticipantes() {
    return _cantidadParticipantes;
  }

  DateTime? getFechaSorteo() {
    return _fechaRealizacion;
  }
}
