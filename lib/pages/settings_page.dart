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
                              _switchWidget(() => {
                                setState(() {
                                eliminarTodos = !eliminarTodos;
                                  
                                })
                              }, disparador: eliminarTodos, activarDisparador: true)
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
                              _switchWidget(() => {
                                activarAnimacion = !activarAnimacion,
                                checkActivarAnimacion(),
                              }, disparador: activarAnimacion, activarDisparador: true)
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
                                _switchWidget(() => {},disparador: nombresDuplicados, activarDisparador: false)
                              ],
                            ),
                          ),
                          Divider(
                            color: const Color.fromARGB(255, 132, 132, 132),
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
                                  onPressed: () => {null},
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
            (activarAnimacion) ? cuentaRegresiva = _! : 0;
          });
        });
  }

  Widget _switchWidget(Function() funcion,{required bool disparador,required bool activarDisparador}){
    return Switch(
      value: disparador,
      activeColor: Colors.white,
      activeTrackColor: Colors.pink.shade900,
      onChanged: (_) => {
         if(activarDisparador){
            disparador = !_,
            print('Valor de disparador: $disparador'),
            // Ejecutamos el metodo para las validaciones pertinentes
            funcion(),
          },
        setState(() {
         
        })
      },
    );
  }
}
