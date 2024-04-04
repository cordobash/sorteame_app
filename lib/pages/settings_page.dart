import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  double? _deviceWidth, _deviceHeight;

  SettingsPageState({Key? key});

  // Flags
  static TextStyle _estiloPersonalizado = TextStyle(fontSize: 18);

  // Iconos para los respectivos checkbox
  // Check eliminar participantes post sorteo.
  IconData _iconoCheckEli =
      (eliminarTodos) ? Icons.check_box : Icons.check_box_outline_blank;

  // Check animaciones
  IconData _iconoCheckAnimacion =
      (activarAnimacion) ? Icons.check_box : Icons.check_box_outline_blank;

  // Check nombres duplicados
  IconData _iconoCheckDuplicados =
      (nombresDuplicados) ? Icons.check_box : Icons.check_box_outline_blank;

  void eliTodos() {
    setState(() {
      if (eliminarTodos == true) {
        _iconoCheckEli = Icons.check_box;
      } else {
        _iconoCheckEli = Icons.check_box_outline_blank;
      }
    });
  }

  void checkActivarAnimacion() {
    setState(() {
      if (activarAnimacion) {
        opacidadCuentaRegresiva = 1.0;
        _iconoCheckAnimacion = Icons.check_box;
      } else {
        opacidadCuentaRegresiva = 0.50;
        _iconoCheckAnimacion = Icons.check_box_outline_blank;
      }
    });
  }

  void checkNombresDuplicados() {
    setState(() {
      if (nombresDuplicados) {
        _iconoCheckDuplicados = Icons.check_box;
      } else {
        // Futura mejora
        _iconoCheckDuplicados = Icons.check_box;
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
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 20),
              child: const Text(
                'Pagina de Ajustes',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
            ),
            SizedBox(
              height: _deviceHeight! * 0.60,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                          ),
                          Opacity(
                            opacity: opacidadCuentaRegresiva!,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cuenta regresiva',
                                  style: _estiloPersonalizado,
                                ),
                                (opacidadCuentaRegresiva == 1.0)
                                    ? _dropDownConteo()
                                    : Text(
                                        '0',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                              IconButton(
                                icon: Icon(_iconoCheckEli),
                                onPressed: () => {
                                  eliminarTodos = !eliminarTodos,
                                  eliTodos()
                                },
                              )
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
                              IconButton(
                                icon: Icon(_iconoCheckAnimacion),
                                onPressed: () => {
                                  activarAnimacion = !activarAnimacion,
                                  checkActivarAnimacion()
                                },
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Permitir nombres duplicados',
                                  style: _estiloPersonalizado,
                                ),
                                IconButton(
                                  icon: Icon(_iconoCheckDuplicados),
                                  onPressed: () => {
                                    // nombresDuplicados = !nombresDuplicados,
                                    // checkNombresDuplicados()
                                    print('Futura mejora')
                                  },
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Opacity(
                            opacity: 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Activar modo oscuro',
                                  style: _estiloPersonalizado,
                                ),
                                IconButton(
                                  icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () => {print('Futura mejora')},
                                )
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey)
                        ],
                      ),
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

  Widget _dropDownConteo() {
    return DropdownButton(
        value: cuentaRegresiva,
        underline: Container(
          color: Colors.pink,
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
            cuentaRegresiva = _!;
          });
        });
  }
}
