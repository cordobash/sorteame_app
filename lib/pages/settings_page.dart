import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

enum Idiomas { Espanol, Ingles, Portugues }

class SettingsPageState extends State<SettingsPage> {
  double? _deviceWidth, _deviceHeight;

  dynamic _accionInicial = Idiomas.values.first;
  int _indiceEnum = 0;

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
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
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
                                _switchWidget(
                                    () => {
                                          setState(() {
                                            eliminarTodos = !eliminarTodos;
                                          })
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
                                _switchWidget(
                                    () => {
                                          activarAnimacion = !activarAnimacion,
                                          checkActivarAnimacion(),
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
                                _switchWidget(
                                    () => {
                                          setState(() {
                                            mostrarDialogoConfirmacion =
                                                !mostrarDialogoConfirmacion;
                                          })
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
                                            _contenedorColor(Colors.orange),
                                            _contenedorColor(Colors.pink),
                                            _contenedorColor(Colors.blue),
                                            _contenedorColor(Colors.red),
                                            _contenedorColor(Colors.purple),
                                            _contenedorColor(Colors.white),
                                            _contenedorColor(Colors.green),

                                            // _contenedorColor(Colors.white),
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

  Widget _contenedorColor(color) {
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
          setState(() {
            colorGlobal = color;
          });
        },
      ),
    );
  }

  Widget _dropDownConteo() {
    return DropdownButton(
        value: cuentaRegresiva,
        underline: Container(
          color: colorGlobal,
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
        onChanged: (_) {
          setState(() {
            (activarAnimacion) ? cuentaRegresiva = _! : 0;
          });
        });
  }

  Widget _switchWidget(Function() funcion,
      {required bool disparador, required bool activarDisparador}) {
    return Switch(
      value: disparador,
      activeColor: Colors.white,
      activeTrackColor: colorGlobal.shade900,
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
          _indiceEnum = (_indiceEnum == 0) ? 1 : 0;
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
                  _contenedorColor(Colors.orange),
                  _contenedorColor(Colors.pink),
                  _contenedorColor(Colors.blue),
                  _contenedorColor(Colors.red),
                  _contenedorColor(Colors.purple),
                  _contenedorColor(Colors.white),
                  _contenedorColor(Colors.green),
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
