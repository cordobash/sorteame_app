import 'dart:math';

import 'package:app_sorteos/pages/SettingsPage.dart';
import 'package:app_sorteos/pages/AboutPage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? _deviceWidth, _deviceHeight;
  String? _vTituloSorteo;

  // Aqui se almacenara a cada uno de los participantes.
  List<String?> _listaParticipantes = List.empty(growable: true);
  String? _nuevoParticipante;
  String? _ganadorSorteo;
  int? _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 25);

  List<Widget> _listaWidgets = [
    Text(
      'No implementation for this page',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text('Resultados de sorteos anteriores',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    SettingsPage(),
    AboutPage()
  ];

  void cambiarPagina(int indice) {
    setState(() {
      _selectedIndex = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'AppSorteos',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: (_selectedIndex == 0)
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Realiza tus sorteos en nuestra app!',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  _tituloSorteo(),
                  const Text('Participantes'),
                  _contenedorListaParticipantes(),
                  _botones(context)
                ],
              ))
            : _listaWidgets[_selectedIndex!],
        drawer: Drawer(
          shadowColor: Colors.white,
          semanticLabel: 'Drawer',
          surfaceTintColor: Colors.yellow,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: const Text(
                  'Lista de opciones',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
              Builder(builder: (context) {
                return ListTile(
                  selected: (_selectedIndex == 0) ? true : false,
                  onTap: () {
                    setState(() {
                      cambiarPagina(0);
                      Navigator.pop(context);
                    });
                  },
                  selectedColor: Colors.pinkAccent,
                  title: const Text('Principal'),
                );
              }),
              Builder(builder: (context) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      cambiarPagina(1);
                      Navigator.pop(context);
                    });
                  },
                  selected: (_selectedIndex == 1) ? true : false,
                  selectedColor: Colors.pinkAccent,
                  title: const Text('Resultados anteriores'),
                );
              }),
              Builder(builder: (context) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      cambiarPagina(2);
                      Navigator.pop(context);
                    });
                  },
                  selected: (_selectedIndex == 2) ? true : false,
                  selectedColor: Colors.pinkAccent,
                  title: const Text('Ajustes'),
                );
              }),
              Builder(builder: (context) {
                return ListTile(
                  selected: (_selectedIndex == 3) ? true : false,
                  onTap: () {
                    setState(() {
                      cambiarPagina(3);
                      Navigator.pop(context);
                    });
                  },
                  selectedColor: Colors.blue,
                  title: const Text('Acerca de'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tituloSorteo() {
    return SizedBox(
        width: _deviceWidth! * 0.80,
        child: TextField(
            onChanged: (_) {
              setState(() {
                _vTituloSorteo = _;
              });
              print('El titulo del sorteo es: $_vTituloSorteo');
            },
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Titulo del sorteo')));
  }

  Widget _contenedorListaParticipantes() {
    return Container(
      height: _deviceHeight! * 0.40,
      width: _deviceWidth! * 0.80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.only(
            left: _deviceWidth! * 0.015, top: _deviceHeight! * 0.01),
        child: Text('$_listaParticipantes'),
      ),
    );
  }

  void calcularGanador() {
    Random ran = new Random();
    // Tendra como rango maximo hasta la longitud maxima del arreglo en donde estan almacenado los participantes
    //                          1 - capacidad actual del arreglo
    int? indice = ran.nextInt(_listaParticipantes.length);
    _ganadorSorteo = _listaParticipantes[indice];
  }

  Widget _botones(dynamic context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Boton anadir participantes
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(10, 200, 247, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Añadir participante'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            'En el siguiente campo anote el nombre del participante: '),
                        Padding(
                          padding: EdgeInsets.only(top: _deviceHeight! * 0.03),
                          child: TextField(
                            onChanged: (_) {
                              setState(() {
                                _nuevoParticipante = _;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Nombre del participante',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => {
                          Navigator.pop(context),
                          _listaParticipantes.add(_nuevoParticipante),
                          print(_listaParticipantes)
                        },
                        child: const Text('OK'),
                      ),
                      TextButton(
                          onPressed: () => {
                                // Se devuelve a inicio y no agrega a la lista el participante
                                Navigator.pop(context)
                              },
                          child: const Text('Cancelar'))
                    ],
                  )),
          child: const Text(
            'Añadir participante',
            style: TextStyle(color: Colors.white),
          ),
        ),

        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(254, 31, 92, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () => {
                  calcularGanador(),
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text((_vTituloSorteo != null)
                                ? _vTituloSorteo!
                                : _vTituloSorteo = "Sorteo sin nombre"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    'El gran ganador/a del $_vTituloSorteo es...'),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: _deviceHeight! * 0.03),
                                  child: Text(
                                    '$_ganadorSorteo',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ],
                          ))
                },
            child: const Text(
              'Realizar sorteo',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
