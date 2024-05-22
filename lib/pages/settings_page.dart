import 'dart:async';

import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

enum Idiomas { Espanol, Ingles, Portugues }

class SettingsPageState extends State<SettingsPage> {
  double? _deviceWidth, _deviceHeight;

  dynamic _accionInicial = Idiomas.values.first;

  List<Color> listaColores = [
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.purple
  ];

  SettingsPageState({Key? key});

  // Flags
  static TextStyle _estiloPersonalizado = TextStyle(fontSize: 16);

  void checkActivarAnimacion() {
    setState(() {
      if (activarAnimacion) {
        opacidadCuentaRegresiva = 1.0;
      } else {
        opacidadCuentaRegresiva = 0.50;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarDatos();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> cargarDatos() async {
    // Creamos instancia de sharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // Cargamos cada una de las opciones
    setState(() {
      // General
      eliminarTodos = prefs.getBool('key_elitodos') ?? true;
      activarAnimacion = prefs.getBool('key_animaciones') ?? true;
      // Editar participante
      mostrarDialogoConfirmacion = prefs.getBool('key_confirmacion') ?? true;
      indiceEnumModo = prefs.getInt('key_editar_modo') ?? 0;
      // Personalizacion.
      // colorGlobal = prefs.get('key_colores') ?? Colors.red;
      indiceEnumIdiomas = prefs.getInt('key_idioma') ?? 0;
      indiceListaConteo = prefs.getInt('key_conteoreg') ?? listaConteo.first;
    });
  }

  Future<void> guardarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('key_elitodos', eliminarTodos);
    prefs.setBool('key_animaciones', activarAnimacion);
    prefs.setBool('key_confirmacion', mostrarDialogoConfirmacion);
    // prefs.setInt('key_colores', listaColores[indiceListaColores] as dynamic);
    prefs.setInt('key_idioma', indiceEnumIdiomas);
    prefs.setInt('key_conteoreg', indiceListaConteo);
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: _deviceHeight! * 0.80,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: ListView(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: _deviceWidth!,
                              child: Text(
                                'General',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Opacity(
                              opacity: opacidadCuentaRegresiva!,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cuenta regresiva',
                                    style: _estiloPersonalizado,
                                  ),
                                  _dropDownConteo()
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Eliminar participantes post sorteo',
                                  style: _estiloPersonalizado,
                                ),
                                _switchWidget(() async {
                                  setState(() {
                                    eliminarTodos = !eliminarTodos;
                                  });
                                  await guardarDatos();
                                  cargarDatos();
                                },
                                    disparador: eliminarTodos,
                                    activarDisparador: true)
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Activar animacion',
                                  style: _estiloPersonalizado,
                                ),
                                _switchWidget(() async {
                                  setState(() {
                                    activarAnimacion = !activarAnimacion;
                                    checkActivarAnimacion();
                                  });
                                  await guardarDatos();
                                  cargarDatos();
                                },
                                    disparador: activarAnimacion,
                                    activarDisparador: true)
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Opacity(
                              opacity: 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Permitir nombres duplicados',
                                    style: _estiloPersonalizado,
                                  ),
                                  _switchWidget(() => {},
                                      disparador: nombresDuplicados,
                                      activarDisparador: false)
                                ],
                              ),
                            ),
                            Divider(
                              color: const Color.fromARGB(255, 132, 132, 132),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              child: SizedBox(
                                width: _deviceWidth!,
                                child: Text(
                                  'Editar Participante',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mostrar dialogo al eliminar participante',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                _switchWidget(() async {
                                  setState(() {
                                    mostrarDialogoConfirmacion =
                                        !mostrarDialogoConfirmacion;
                                  });
                                  await guardarDatos();
                                  cargarDatos();
                                },
                                    disparador: mostrarDialogoConfirmacion,
                                    activarDisparador: true)
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Opacity(
                              opacity: 0.45,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Maximo de celdas por fila en modo mosaico'),
                                      Text(
                                        '${(_deviceWidth! < 500) ? 2 : 3}',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]),
                              ),
                            ),
                            Divider(color: Colors.grey),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              child: SizedBox(
                                width: _deviceWidth!,
                                child: Text(
                                  'Personalizacion',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Color principal',
                                  style: _estiloPersonalizado,
                                ),
                                (_deviceWidth! > 400)
                                    ? SizedBox(
                                        width: 235,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _contenedorColor(
                                                listaColores[0], 0),
                                            _contenedorColor(
                                                listaColores[1], 1),
                                            _contenedorColor(
                                                listaColores[2], 2),
                                            _contenedorColor(
                                                listaColores[3], 3),
                                            _contenedorColor(
                                                listaColores[4], 4),
                                            _contenedorColor(
                                                listaColores[5], 5),
                                          ],
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3))),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              showDragHandle: true,
                                              enableDrag: true,
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) =>
                                                  _modalSeleccionarColor());
                                        },
                                        child: Text(
                                          'Seleccionar color',
                                          style: TextStyle(color: Colors.white),
                                        ))
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Seleccionar idioma',
                                  style: _estiloPersonalizado,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    LimitedBox(
                                        maxWidth:
                                            (_deviceWidth! < 400) ? 165 : 200,
                                        maxHeight: 40,
                                        child: _segmentedButtons()),
                                  ],
                                )
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Opacity(
                              opacity: 0.45,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Activar modo oscuro',
                                    style: _estiloPersonalizado,
                                  ),
                                  _switchWidget(() => {},
                                      disparador: false,
                                      activarDisparador: false)
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey)
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _contenedorColor(color, indice) {
    return Container(
      height: 33,
      width: 30,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        child: SizedBox(),
        onPressed: () async {
          setState(() {
            colorGlobal = color;
            indiceListaColores = indice;
          });
          await guardarDatos();
          cargarDatos();
        },
      ),
    );
  }

  Widget _dropDownConteo() {
    return DropdownButton(
        value: indiceListaConteo,
        underline: Container(
          color: listaColores[indiceListaColores],
          height: 2,
        ),
        icon: Icon(Icons.format_list_numbered_rtl_sharp),
        items: listaConteo.map<DropdownMenuItem<int>>((int valor) {
          return DropdownMenuItem<int>(
              value: valor,
              child: Text(
                valor.toString(),
                style: TextStyle(fontSize: 18),
              ));
        }).toList(),
        onChanged: (_) async {
          setState(() {
            (activarAnimacion) ? indiceListaConteo = _! : 0;
          });
          await guardarDatos();
          cargarDatos();
        });
  }

  Widget _switchWidget(Function() funcion,
      {required bool disparador, required bool activarDisparador}) {
    return Switch(
      value: disparador,
      activeColor: Colors.white,
      activeTrackColor: listaColores[indiceListaColores],
      onChanged: (_) => {
        if (activarDisparador)
          {
            disparador = !_,
            // Ejecutamos el metodo para las validaciones pertinentes
            funcion(),
          },
        setState(() {})
      },
    );
  }

  Widget _segmentedButtons() {
    return SegmentedButton<Idiomas>(
      style: SegmentedButton.styleFrom(
          selectedBackgroundColor: colorGlobal.withOpacity(0.15)),
      showSelectedIcon: false,
      segments: const <ButtonSegment<Idiomas>>[
        ButtonSegment<Idiomas>(
          value: Idiomas.Espanol,
          label: Text(
            '🇲🇽',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ButtonSegment<Idiomas>(
          value: Idiomas.Ingles,
          label: Text(
            '🇺🇸',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ButtonSegment(
          value: Idiomas.Portugues,
          label: Text(
            '🇵🇹',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
      selected: <Idiomas>{_accionInicial},
      onSelectionChanged: (Set<Idiomas> nuevoElemento) {
        setState(() {
          // De esta forma solo un valor estara seleccionado.
          _accionInicial = nuevoElemento.first;
          indiceEnumIdiomas = (indiceEnumIdiomas == 0) ? 1 : 0;
        });
      },
    );
  }

  Widget _modalSeleccionarColor() {
    return Container(
        height: 200,
        width: _deviceWidth! * 0.90,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Selecciona uno de los siguientes colores: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _contenedorColor(listaColores[0], 0),
                  _contenedorColor(listaColores[1], 1),
                  _contenedorColor(listaColores[2], 2),
                  _contenedorColor(listaColores[3], 3),
                  _contenedorColor(listaColores[4], 4),
                  _contenedorColor(listaColores[5], 5),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
