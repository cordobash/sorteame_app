import 'dart:async';

import 'package:app_sorteos/generated/l10n.dart';
import 'package:app_sorteos/models/boxes.dart';
import 'package:app_sorteos/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

enum Idiomas { Espanol, Ingles, Portugues }

class SettingsPageState extends State<SettingsPage> {
  Locale locale = new Locale('es');
  double? _deviceWidth, _deviceHeight;

  // Idiomas _accionInicial = Idiomas.values.first;
  Idiomas _accionInicial = Idiomas.values.elementAt(0);

  SettingsPageState({Key? key});
  static TextStyle _estiloPersonalizado = TextStyle(fontSize: 16);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarDatos();
    _accionInicial = Idiomas.values.elementAt(indiceEnumIdiomas);
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
      // Personalizacion.
      indiceEnumIdiomas = prefs.getInt('key_idioma') ?? 0;
      indiceListaConteo = prefs.getInt('key_conteoreg') ?? listaConteo.first;
      indiceListaColores = prefs.getInt('key_indicecolor') ?? 0;
      colorGlobal = listaColores[indiceListaColores];
      S.load((indiceEnumIdiomas == 0) ? Locale('es') : Locale('en'));
    });
  }

  Future<void> guardarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('key_elitodos', eliminarTodos);
    prefs.setBool('key_animaciones', activarAnimacion);
    prefs.setBool('key_confirmacion', mostrarDialogoConfirmacion);
    prefs.setInt('key_idioma', indiceEnumIdiomas);
    prefs.setInt('key_conteoreg', indiceListaConteo);
    prefs.setInt('key_indicecolor', indiceListaColores);
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
                                S.current.general,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Opacity(
                              opacity: (activarAnimacion) ? 1.0 : 0.40,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.current.countdown,
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
                                  S.current.deleteAfter,
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
                                  S.current.activateAnimations,
                                  style: _estiloPersonalizado,
                                ),
                                _switchWidget(() async {
                                  setState(() {
                                    activarAnimacion = !activarAnimacion;
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
                                    S.current.duplicatedNames,
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
                                  S.current.editparticipant,
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
                                  S.current.showDeleteDialog,
                                  style: TextStyle(fontSize: 16),
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
                                      Text(S.current.maxCells),
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
                                  S.current.personalization,
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
                                  S.current.themeApp,
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
                                          S.current.modalchoicecolor,
                                          style: TextStyle(color: Colors.white),
                                        ))
                              ],
                            ),
                            Divider(color: Colors.grey),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S.current.language,
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
                                    S.current.thememode,
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
        onPressed: () {
          context.read<MainProvider>().cambiarIndice(indice);

          setState(() {
            colorGlobal = listaColores[indice];
            indiceListaColores = indice;
            // context.watch<MainProvider>().cambiarIndice(3);
            // print('color actual: ${context.read<MainProvider>().colorGlobal}');
          });
          guardarDatos();
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
      ],
      selected: <Idiomas>{_accionInicial},
      onSelectionChanged: (Set<Idiomas> nuevoElemento) {
        setState(() {
          // De esta forma solo un valor estara seleccionado.
          _accionInicial = nuevoElemento.first;
          indiceEnumIdiomas = _accionInicial.index;
          switch (indiceEnumIdiomas) {
            case 0:
              locale = Locale('es');
              setState(() {
                S.load(locale);
                guardarDatos();
                cargarDatos();
              });
              break;
            case 1:
              locale = Locale('en');
              setState(() {
                S.load(locale);
                guardarDatos();
                cargarDatos();
              });
              break;
            default:
              locale = Locale('es');
              S.load(locale);
          }
        });
        guardarDatos();
        cargarDatos();
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
                S.current.choicecolor,
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
                    S.current.ok,
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
