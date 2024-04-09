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
  // Constructor que se usara para la insercion de datos a la db
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

  String? getNombreMes(int mes) {
    List<String> _listaMeses = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre"
    ];
    return _listaMeses[mes - 1];
  }

  String validarMinutos(int minuto) {
    if (minuto >= 0 && minuto <= 9) {
      return "0" + minuto.toString();
    }
    return minuto.toString();
  }
}
