// Packages

import 'dart:math';

import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';

// Models
import '../models/Sorteo.dart';

// Vistas adicionales
class AnterioresPage extends StatefulWidget {
  AnterioresPage({Key? key});

  @override
  State<StatefulWidget> createState() => _AnterioresPageState();
}

class _AnterioresPageState extends State<AnterioresPage> {
  double? _deviceWidth, _deviceHeight;
  bool _cajaVacia = boxSorteo.isEmpty;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: (_cajaVacia)
          ? _mensajeDefecto()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    itemCount: boxSorteo.length,
                    itemBuilder: (context, index) {
                      Sorteo sort = boxSorteo.getAt(index);
                      int indiceMes = sort.getFechaSorteo()!.month;
                      String _formatoMinuto =
                          sort.validarMinutos(sort.getFechaSorteo()!.minute);
                      // visibleFloatingAnteriores =
                      //     (boxSorteo.isNotEmpty) ? true : false;
                      return ListTile(
                        title: _contenedorResultados(
                            tituloSorteo: sort.getTitulo(),
                            ganadorSorteo: sort.getGanador(),
                            cantidadParticipantes: sort.getCantParticipantes(),
                            dia: sort.getFechaSorteo()!.day,
                            hora: sort.getFechaSorteo()!.hour,
                            anio: sort.getFechaSorteo()!.year,
                            mes: sort.getNombreMes(indiceMes),
                            minuto: _formatoMinuto,
                            index: index),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: (visibleFloatingAnteriores)
          ? FloatingActionButton(
              backgroundColor: colorGlobal.shade900,
              onPressed: () => {},
              child: IconButton(
                onPressed: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) =>
                        _dialogEliminarTodosParticipantes(context)),
                icon: Icon(fill: 1, Icons.delete_rounded, color: Colors.white),
              ),
            )
          : null,
    );
  }

  dynamic elegirColor(ColorGlobal) {
    Random ran = new Random();
    List<Color> _listaColores = [
      ColorGlobal,
      ColorGlobal.shade600,
      ColorGlobal.shade700,
      ColorGlobal.shade800,
      ColorGlobal.shade900
    ];
    int indice = ran.nextInt(_listaColores.length);
    return _listaColores[indice];
  }

  Widget _contenedorResultados({
    required tituloSorteo,
    required ganadorSorteo,
    required cantidadParticipantes,
    required index,
    required dia,
    required mes,
    required anio,
    required hora,
    required minuto,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Container(
            height: _deviceHeight! * 0.30,
            width: _deviceWidth! * 0.95,
            decoration: BoxDecoration(
                color: elegirColor(colorGlobal),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: _deviceWidth! * 0.68,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              tituloSorteo,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Manrope'),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      IconButton(
                        color: Colors.white,
                        hoverColor: Colors.white70,
                        iconSize: 30,
                        onPressed: () => {
                          setState(() {
                            boxSorteo.deleteAt(index);
                            if (boxSorteo.isEmpty) {
                              visibleFloatingAnteriores = false;
                              _cajaVacia = true;
                            } else {
                              visibleFloatingAnteriores = true;
                            }
                          })
                        },
                        icon: Icon(Icons.delete),
                      )
                    ],
                  ),
                  SizedBox(
                    width: _deviceWidth,
                    child: Text(
                      'Ganador: $ganadorSorteo',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poetsen'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Numero de participantes: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "$cantidadParticipantes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: _deviceWidth,
                    child: Text(
                      "Fecha del sorteo: $dia de ${mes} del $anio a las $hora:${minuto} hrs.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Mensaje por defecto cuando no haya registros
  Widget _mensajeDefecto() {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Realiza tu primer sorteo!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'Poetsen'),
          ),
          Image(
            width: 300,
            height: _deviceHeight! * 0.55,
            image: AssetImage('lib/src/images/primer_sorteo.png'),
          )
        ],
      ),
    ));
  }

  Widget _dialogEliminarTodosParticipantes(context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Icon(Icons.warning_rounded, color: Colors.yellow.shade900, size: 30),
          const Text('Advertencia',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.bold)),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: const Text(
          'Esta accion eliminara todos los registros.¿Desea continuar?',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Barlow'),
        ),
      ),
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: () {
            boxSorteo.clear();
            setState(() {
              _cajaVacia = true;
              visibleFloatingAnteriores = false;
            });
            Navigator.pop(context);
          },
          child: const Text(
            'Eliminar todo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: TextStyle(color: colorGlobal.shade700),
          ),
        ),
      ],
    );
  }
}
