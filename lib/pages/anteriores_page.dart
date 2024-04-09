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
                      visibleFloating = (boxSorteo.isNotEmpty) ? true : false;
                      return ListTile(
                        title: _contenedorResultados(
                            tituloSorteo: sort.getTitulo(),
                            ganadorSorteo: sort.getGanador(),
                            cantidadParticipantes: sort.getCantParticipantes(),
                            dia: sort.getFechaSorteo()!.day,
                            hora: sort.getFechaSorteo()!.hour,
                            anio: sort.getFechaSorteo()!.year,
                            mes: sort.getFechaSorteo()!.month,
                            minuto: sort.getFechaSorteo()!.minute,
                            index: index),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: (visibleFloatingAnteriores)
          ? FloatingActionButton(
              onPressed: () => {},
              child: IconButton(
                onPressed: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.white,
                          icon: Icon(
                            Icons.warning,
                            color: Colors.orange,
                            size: 25,
                          ),
                          title: const Text('Advertencia'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          content: const Text(
                            'Esta accion eliminara todos los registros.¿Desea continuar?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                boxSorteo.clear();
                                setState(() {
                                  _cajaVacia = true;
                                  visibleFloatingAnteriores = false;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Eliminar todo'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar'),
                            ),
                          ],
                        )),
                icon: Icon(Icons.delete),
              ),
            )
          : null,
    );
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Container(
            height: _deviceHeight! * 0.25,
            width: _deviceWidth! * 0.90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: _deviceWidth,
                      child: Text(
                        tituloSorteo,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ganador: $ganadorSorteo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        IconButton(
                          color: Colors.red,
                          hoverColor: Colors.grey.shade500,
                          iconSize: 30,
                          onPressed: () => {
                            setState(() {
                              boxSorteo.deleteAt(index);
                              if (boxSorteo.isEmpty) {
                                visibleFloatingAnteriores = false;
                                _cajaVacia = true;
                              } else {
                                visibleFloating = true;
                              }
                            })
                          },
                          icon: Icon(Icons.delete),
                        )
                      ]),
                  Row(
                    children: [
                      Text(
                        'Numero de participantes: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                      Text(
                        "$cantidadParticipantes",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: _deviceWidth,
                    child: Text(
                      "Fecha del sorteo: $dia de $mes del $anio a las $hora:$minuto",
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

// Mensaje por defecto cuando no haya registros
  Widget _mensajeDefecto() {
    return Container(
        child: Center(
      child: const Text(
        'Realiza tu primer sorteo!',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ));
  }
}
