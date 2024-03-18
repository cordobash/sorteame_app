class Sorteo{
  String? _tituloSorteo;
  String? _ganadorSorteo;
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
  String? _getGanador(){
    return _ganadorSorteo;
  }
  int? _getCantParticipantes(){
    return _cantidadParticipantes;
  }


}