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
  static bool _activarModoOscuro = false;
  static bool _eliminar_a_todos = true;

  static TextStyle _estiloPersonalizado = TextStyle(fontSize: 18);

  IconData _iconoCheckMO = (_activarModoOscuro)
      ? Icons.check_box
      : Icons.check_box_outline_blank_outlined; // icono check modo oscuro
  IconData _iconoCheckEli = (_eliminar_a_todos)
      ? Icons.check_box
      : Icons
          .check_box_outline_blank; // Icono check eliminar a todos los participantes

  void cambiarModo() {
    setState(() {
      // Cambiamos el estado del modo.
      if (_activarModoOscuro) {
        _iconoCheckMO = Icons.check_box;
      } else {
        _iconoCheckMO = Icons.check_box_outline_blank;
      }
    });
  }

  void eliTodos() {
    setState(() {
      if (_eliminar_a_todos == true) {
        _iconoCheckEli = Icons.check_box;
      } else {
        _iconoCheckEli = Icons.check_box_outline_blank;
      }
    });
  }

  // Getter modo oscuro
  bool GetModoActual() {
    return _activarModoOscuro;
  }

  bool GetEliTodos() {
    return _eliminar_a_todos;
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
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        color: Colors.grey,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Activar modo oscuro(WIP)',
                              style: _estiloPersonalizado,
                              textAlign: TextAlign.start,
                            ),
                            IconButton(
                                disabledColor: Colors.grey,
                                onPressed: () => {
                                        setState(() {
                                      _activarModoOscuro = !_activarModoOscuro;
                                          cambiarModo();
                                        })
                                    },
                                icon: Icon(_iconoCheckMO))
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cuenta regresiva',
                            style: _estiloPersonalizado,
                          ),
                          Text(
                            '3',
                            style: _estiloPersonalizado,
                            textAlign: TextAlign.justify,
                          )
                        ],
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
                              _eliminar_a_todos = !_eliminar_a_todos,
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
                            'Numero de ganadores',
                            style: _estiloPersonalizado,
                          ),
                          Text(
                            '1',
                            style: _estiloPersonalizado,
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Permitir nombres duplicados',
                            style: _estiloPersonalizado,
                          ),
                          Text(
                            'No',
                            style: _estiloPersonalizado,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
