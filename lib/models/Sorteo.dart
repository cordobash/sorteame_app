import 'package:hive/hive.dart';
part 'Sorteo.g.dart';

@HiveType(typeId: 1)
class Sorteo{
  @HiveField(0)
  String? _tituloSorteo;

  @HiveField(1)
  String? _ganadorSorteo;

  @HiveField(2)
  int? _cantidadParticipantes;

  // Constructor por defecto
  Sorteo();
  Sorteo.conDatos({required tituloSorteo, required ganadorSorteo, required cantParticipantes}){
    this._tituloSorteo = tituloSorteo;
    this._ganadorSorteo = ganadorSorteo;
    this._cantidadParticipantes = cantParticipantes;
  }

  // Getters
  String? getTitulo(){
    return _tituloSorteo;
  }
  String? getGanador(){
    return _ganadorSorteo;
  }
  int? getCantParticipantes(){
    return _cantidadParticipantes;
  }

  // Setters
  void setTitulo(String nuevoTitulo){
    this._tituloSorteo = nuevoTitulo;
  }

  void setGanador(String ganadorNuevo){
    this._ganadorSorteo = ganadorNuevo;
  }

  void setCantParticipantes(int nuevaCant){
    this._cantidadParticipantes = nuevaCant;
  }

}