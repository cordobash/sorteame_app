// main.dart: Archivo principal de ejecucion.
// Paquetes de la libreria o externos.
import 'dart:io';
import 'dart:math';
import 'package:app_sorteos/pages/post_sorteo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// Vistas.
import 'package:app_sorteos/pages/settings_page.dart';
import 'package:app_sorteos/pages/about_page.dart';
import 'package:app_sorteos/pages/anteriores_page.dart';
import 'package:app_sorteos/pages/editar_participante_page.dart';

// Modelos.
import 'package:app_sorteos/models/boxes.dart';
import 'package:app_sorteos/models/Archivo.dart';
import 'package:app_sorteos/models/Sorteo.dart';

void main(List<String> args) async {
  // Colors inicial
  colorGlobal = Colors.red;
  await Hive.initFlutter();
  Hive.registerAdapter(SorteoAdapter());
  // Abriendo la box
  boxSorteo = await Hive.openBox<Sorteo>('sorteoBox');

  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/crpage': (context) => PostPage(),
        '/editar': (context) => EditarPage(),
      },
      home: MyApp()));
}

TextEditingController textEditingController = TextEditingController();

class MyApp extends StatefulWidget {
  MyApp({Key? key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState({Key? key});

  var objSettings = new SettingsPageState();

  double? _deviceWidth, _deviceHeight;
  Archivo archivo = Archivo();
  String? _nuevoParticipante;

  late int _selectedIndex = 0;
  bool _mostrarErrorText = false;

  bool _activarErrorTextAnadirParticipante = false;

  // Manejo de campos vacios
  Color _colorContenedorBorder = Colors.grey.shade700;
  bool? _visibleLabel = false;

  final List<Color> _gradienteRosaRojoAzul = [
    colorGlobal,
    colorGlobal.shade400,
    colorGlobal.shade500,
    colorGlobal.shade600,
    colorGlobal.shade900,
  ];

  final List<String> _titulosSuperior = [
    "Principal",
    "Resultados anteriores",
    "Ajustes",
    "Acerca de mi"
  ];

  final List<Widget> _listaWidgets = [
    const Text(
      'No implementation for this page',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    AnterioresPage(),
    SettingsPage(),
    AboutPage()
  ];

  void cambiarPagina(int indice) {
    setState(() {
      _selectedIndex = indice;
    });
  }

  void cambiarAnimada() {
    Navigator.pushNamed(context, '/crpage');
    validarEliminarTodos();
  }

  void validarEliminarTodos() {
    if (eliminarTodos == true) {
      setState(() {
        listaParticipantes = [];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    listaParticipantes = [
      "Joselu",
      "Marco Acosta",
      "Isaias",
      "Juan",
      "Pochetino",
      "Lucio",
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        setState(() {
          (kIsWeb == false)
              ? showDialog(
                  context: context,
                  builder: (context) => _alertSalirAplicacion())
              : null;
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Builder(
                builder: (context) => (_deviceHeight! >= 350)
                    ? IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      )
                    : const SizedBox()),
            title: Text(
              (_selectedIndex != 0)
                  ? '${_titulosSuperior[_selectedIndex]}'
                  : 'SorteaMe App',
              style: (_selectedIndex != 0)
                  ? TextStyle(
                      color: Colors.white, fontFamily: 'Manrope', fontSize: 18)
                  : TextStyle(
                      fontFamily: 'Cerdaville',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
            ),
            backgroundColor: colorGlobal.shade900,
            centerTitle: false,
          ),
          body: (_selectedIndex == 0)
              ? (_deviceHeight! >= 350)
                  ? _menuPrincipal()
                  : _mensajeAlturaInsuficiente()
              : (_deviceHeight! >= 350)
                  ? _listaWidgets[_selectedIndex]
                  : _mensajeAlturaInsuficiente(),
          drawer: Drawer(
            shape: ShapeBorder.lerp(null, null, 15.0),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            semanticLabel: 'Drawer',
            // surfaceTintColor: Colors.yellow,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: const Text(
                    'Menu de opciones',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cerdaville'),
                  ),
                  decoration: BoxDecoration(color: colorGlobal.shade700),
                ),
                Builder(builder: (context) {
                  return ListTile(
                    leading: Icon(
                      Icons.menu,
                      color: (_selectedIndex == 0)
                          ? colorGlobal
                          : colorGlobal.shade900,
                    ),
                    selected: (_selectedIndex == 0) ? true : false,
                    onTap: () {
                      setState(() {
                        cambiarPagina(0);
                        Navigator.pop(context);
                      });
                    },
                    selectedColor: colorGlobal,
                    title: const Text('Principal'),
                  );
                }),
                Builder(builder: (context) {
                  return ListTile(
                    leading: Icon(
                      Icons.history,
                      color: (_selectedIndex == 1)
                          ? colorGlobal
                          : colorGlobal.shade900,
                    ),
                    onTap: () {
                      setState(() {
                        cambiarPagina(1);
                        Navigator.pop(context);
                      });
                    },
                    selected: (_selectedIndex == 1) ? true : false,
                    selectedColor: colorGlobal,
                    title: const Text('Resultados anteriores'),
                  );
                }),
                Builder(builder: (context) {
                  return ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: (_selectedIndex == 2)
                          ? colorGlobal
                          : colorGlobal.shade900,
                    ),
                    onTap: () {
                      setState(() {
                        cambiarPagina(2);
                        Navigator.pop(context);
                      });
                    },
                    selected: (_selectedIndex == 2) ? true : false,
                    selectedColor: colorGlobal,
                    title: const Text('Ajustes'),
                  );
                }),
                Builder(builder: (context) {
                  return ListTile(
                    leading: Icon(
                      Icons.message,
                      color: (_selectedIndex == 3)
                          ? colorGlobal
                          : colorGlobal.shade900,
                    ),
                    selected: (_selectedIndex == 3) ? true : false,
                    onTap: () {
                      setState(() {
                        cambiarPagina(3);
                        Navigator.pop(context);
                      });
                    },
                    selectedColor: colorGlobal,
                    title: const Text('Acerca de'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuPrincipal() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: _deviceHeight! * 0.70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tituloSorteo(),
                SizedBox(
                    width: _deviceWidth! * 0.75,
                    child: const Text('Lista de participantes')),
                _visibleLabel!
                    ? Text(
                        'Añade al menos 1 participante',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    : SizedBox(),
                _contenedorListaParticipantes(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: (_deviceWidth! > 400)
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _btnRealizarSorteo(context),
                      Padding(padding: const EdgeInsets.only(bottom: 10)),
                      _btnAgregarParticipantes(),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _btnRealizarSorteo(context),
                      Padding(padding: const EdgeInsets.only(bottom: 10)),
                      _btnAgregarParticipantes(),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  // btnAgregarParticipantes
  Widget _btnAgregarParticipantes() {
    return SizedBox(
      height: _deviceHeight! * 0.06,
      width: 205,
      child: ElevatedButton(
          onPressed: () => {
                showModalBottomSheet(
                    showDragHandle: true,
                    enableDrag: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        width: _deviceWidth! * 0.95,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Anadir participante',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) =>
                                                  _alertAnadirUnParticipante(
                                                      setState),
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      'Manualmente',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                                builder: (context, setState) =>
                                                    (kIsWeb)
                                                        ? _alertNoDisponibleWeb()
                                                        : _alertAnadirArchivo(
                                                            archivo, setState));
                                          });
                                    },
                                    child: Text(
                                      'Subir un archivo',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      );
                    }),
              },
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.white),
              Text('Agregar participante',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                (colorGlobal != Colors.white) ? colorGlobal : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          )),
    );
  }

//  Esta validacion se hace para el titulo y para los participantes(Solo modo manual, ya que el modo archivo esta validado de otra forma).
  bool _validarCaracteres(String cadenaValidar) {
    List<int> _caracteresNoValidos = [];
    _generadorElementos(_caracteresNoValidos, 33, 47);
    _generadorElementos(_caracteresNoValidos, 58, 64);
    _generadorElementos(_caracteresNoValidos, 91, 95);
    _generadorElementos(_caracteresNoValidos, 165, 255);

    for (int i = 0; i < cadenaValidar.length; i++) {
      if (_buscarElemento(
          _caracteresNoValidos, cadenaValidar[i].codeUnitAt(0))) {
        return true;
      }
    }
    return false;
  }

  bool _buscarElemento(lista, elemento) {
    int inicio = 0;
    int fin = lista.length - 1;
    while (inicio <= fin) {
      int medio = ((inicio + fin) / 2).floor();
      if (lista[medio] == elemento) {
        return true;
      }
      if (lista[medio] < elemento) {
        inicio = medio + 1;
      } else {
        fin = medio - 1;
      }
    }
    return false;
  }

  void _generadorElementos(List<dynamic> lista, int inicio, int fin) {
    for (int i = inicio; i <= fin; i++) {
      lista.add(i);
    }
  }

  Widget _tituloSorteo() {
    return SizedBox(
        width: _deviceWidth! * 0.80,
        child: TextField(
            controller: textEditingController,
            onChanged: (_) {
              setState(() {
                vTituloSorteo = _;
                if (vTituloSorteo.isEmpty ||
                    _validarCaracteres(vTituloSorteo)) {
                  _mostrarErrorText = true;
                } else {
                  _mostrarErrorText = false;
                }
              });
            },
            onSubmitted: (_nuevoValor) => {vTituloSorteo = _nuevoValor},
            obscureText: false,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorGlobal.shade900),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorGlobal),
                ),
                errorText:
                    (_mostrarErrorText || _validarCaracteres(vTituloSorteo))
                        ? 'El titulo esta vacio/tiene caracteres invalidos'
                        : null,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Titulo del sorteo')));
  }

  Widget _contenedorListaParticipantes() {
    return Container(
      height: _deviceHeight! * 0.40,
      width: _deviceWidth! * 0.80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _colorContenedorBorder)),
      child: Padding(
        padding: EdgeInsets.only(
            left: _deviceWidth! * 0.015, top: _deviceHeight! * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ListView(
                    children: [Text('${listaParticipantes.join(', ')}')])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${listaParticipantes.length}',
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () => {
                              setState(() {
                                // Se redirije al usuario a la pagina de editar_participante.
                                Navigator.pushNamed(context, '/editar');
                              })
                            },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        enableFeedback: true,
                        onPressed: () => {
                              setState(() {
                                // Vaciamos la lista general
                                listaParticipantes = [];
                              })
                            },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void calcularGanador() {
    Random ran = Random();
    // Tendra como rango maximo hasta la longitud maxima del arreglo en donde estan almacenado los participantes
    //                          1 - capacidad actual del arreglo
    try {
      int? indice = ran.nextInt(listaParticipantes.length);
      ganadorSorteo = listaParticipantes[indice];
      setState(() {
        visibleFloatingAnteriores = true;
        _colorContenedorBorder = Colors.grey;
        _visibleLabel = false;
      });
    } catch (e) {
      setState(() {
        if (listaParticipantes.isEmpty) {
          _colorContenedorBorder = Colors.red;
          _visibleLabel = true;
        }
      });
    }
  }

  Widget _mensajeAlturaInsuficiente() {
    return Center(
        child: Text(
      'La resolucion del dispositivo no es la optima para que la aplicacion pueda operar',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ));
  }

  Widget _btnRealizarSorteo(dynamic context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: _deviceHeight! * 0.06,
          child: Opacity(
            opacity: (textEditingController.text.isNotEmpty &&
                    listaParticipantes.isNotEmpty &&
                    _validarCaracteres(vTituloSorteo) == false)
                ? 1.0
                : 0.5,
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [..._gradienteRosaRojoAzul])),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () => {
                  calcularGanador(),
                  if (listaParticipantes.isNotEmpty &&
                      textEditingController.text.isNotEmpty &&
                      _validarCaracteres(vTituloSorteo) == false)
                    {
                      boxSorteo.put(
                          'key_${textEditingController.text}_${ganadorSorteo}',
                          Sorteo.conDatos(
                              tituloSorteo: textEditingController.text,
                              cantParticipantes: listaParticipantes.length,
                              ganadorSorteo: ganadorSorteo)),
                      activarAnimacion
                          ? cambiarAnimada()
                          : showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) =>
                                  _alertDialogSinAnimacion(),
                            )
                    }
                  else
                    {
                      setState(() {
                        textEditingController.text.isEmpty ||
                                textEditingController.text
                                        .toString()
                                        .codeUnitAt(0) ==
                                    32
                            ? _mostrarErrorText = true
                            : _mostrarErrorText = false;
                      })
                    }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                        (textEditingController.text.isNotEmpty &&
                                listaParticipantes.isNotEmpty)
                            ? Icons.play_circle
                            : Icons.play_disabled,
                        color: Colors.white),
                    Text(
                      'Realizar sorteo',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// Añade los participantes de tu sorteo desde un archivo
  Widget _alertAnadirArchivo(Archivo archivo, state) {
    String _nombreArchivoSeleccionado =
        archivo.getNombreArchivo() ?? "Ningun archivo seleccionado";
    return AlertDialog(
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Row(
        children: [
          Icon(Icons.file_upload),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text('Selecciona un archivo',
              style: TextStyle(
                fontFamily: 'Poetsen',
                color: Colors.black,
              )),
        ],
      ),
      content: SizedBox(
        height: _deviceHeight! * 0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Añade los participantes de tu sorteo desde un archivo',
              style: TextStyle(fontFamily: 'Manrope'),
            ),

            const Text(
              'El tipo de archivo admitido para esta operacion es solamente en formato .txt',
              style: TextStyle(fontFamily: 'Manrope'),
            ),
            Text(
              "${_nombreArchivoSeleccionado}",
              style:
                  TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold),
            ),
            // "${_nombreArchivoSeleccionado.substring(1, _nombreArchivoSeleccionado.length - 1)}"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorGlobal.shade900,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () => {
                      archivo.abrirArchivo().then((nombreArchivo) {
                        _nombreArchivoSeleccionado = nombreArchivo;
                      }).onError((error, stackTrace) {
                        _nombreArchivoSeleccionado =
                            'Error al cargar el archivo';
                      }).whenComplete(() {
                        // Actualizamos la ui una vez este seleccionado el archivo.
                        state(() => {});
                      }),
                    },
                child: Text(
                  'Selecciona un archivo',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => {
            Navigator.pop(context),
            setState(() {
              if (listaParticipantes.isNotEmpty) {
                _visibleLabel = false;
                _colorContenedorBorder = Colors.grey;
              }
            })
          },
          child: Text(
            'Salir',
            style: TextStyle(color: colorGlobal),
          ),
        )
      ],
    );
  }

  Widget _alertSalirAplicacion() {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.black,
      title: Row(
        children: [
          Icon(Icons.exit_to_app, color: Colors.red),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            'Salir de la aplicacion',
            style: TextStyle(
                fontFamily: 'Barlow',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        '¿Estas seguro de salir de la aplicacion?',
        style: TextStyle(
            fontFamily: 'Barlow',
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          child: Text(
            'Salir',
            style: TextStyle(color: colorGlobal.shade900),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancelar',
            style: TextStyle(color: colorGlobal.shade900),
          ),
        )
      ],
    );
  }

  Widget _alertAnadirUnParticipante(state) {
    return AlertDialog(
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.blue,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            'Añadir participante',
            style: TextStyle(fontFamily: 'Poetsen', fontSize: 20),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'En el siguiente campo anote el nombre del participante: ',
            style: TextStyle(fontFamily: 'Manrope'),
          ),
          Padding(
            padding: EdgeInsets.only(top: _deviceHeight! * 0.03),
            child: TextField(
              onChanged: (_) {
                state(() {
                  _nuevoParticipante = _;
                  if (_nuevoParticipante!.isEmpty ||
                      _validarCaracteres(_nuevoParticipante!)) {
                    _activarErrorTextAnadirParticipante = true;
                  } else {
                    _activarErrorTextAnadirParticipante = false;
                  }
                });
              },
              decoration: InputDecoration(
                errorText: (_activarErrorTextAnadirParticipante)
                    ? 'El contenido del campo no es adecuado.'
                    : null,
                enabled: true,
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
            setState(() {
              // Caso en el que todo este bien
              // true | false
              if (_nuevoParticipante!.isNotEmpty &&
                  _validarCaracteres(_nuevoParticipante!) == false &&
                  _nuevoParticipante.toString().codeUnitAt(0) != 32) {
                listaParticipantes.add(_nuevoParticipante!);
                _activarErrorTextAnadirParticipante = false;
                Navigator.pop(context);
                print(_nuevoParticipante.toString().codeUnitAt(0));
                // Limipamos el nombre guardado en cache
                _nuevoParticipante = '';
              } else if (_validarCaracteres(_nuevoParticipante!) ||
                  _nuevoParticipante!.isEmpty ||
                  _nuevoParticipante.toString().codeUnitAt(0) == 32) {
                state(() {
                  _activarErrorTextAnadirParticipante = true;
                });
              }
              // listaParticipantes.add(_nuevoParticipante!);
              // Navigator.pop(context);
              // print('El nuevo participante $_nuevoParticipante');
              if (listaParticipantes.isNotEmpty) {
                _colorContenedorBorder = Colors.grey;
                _visibleLabel = false;
              } else {
                _colorContenedorBorder = Colors.red;
                _visibleLabel = true;
              }
            })
          },
          child: Text(
            'OK',
            style: TextStyle(color: colorGlobal.shade900),
          ),
        ),
        TextButton(
            onPressed: () => {
                  // Se devuelve a inicio y no agrega a la lista el participante
                  Navigator.pop(context),
                  setState(() {
                    _activarErrorTextAnadirParticipante = false;
                  })
                },
            child: Text(
              'Cancelar',
              style: TextStyle(color: colorGlobal.shade900),
            ))
      ],
    );
  }

  Widget _alertNoDisponibleWeb() {
    return AlertDialog(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Icon(Icons.info, color: Colors.blue),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text('Informacion'),
        ],
      ),
      content: Text('Funcion no disponible en version web.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Aceptar',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: colorGlobal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              shadowColor: Colors.black),
        ),
      ],
    );
  }

  Widget _alertDialogSinAnimacion() {
    return AlertDialog(
      title: Text((vTituloSorteo != null)
          ? vTituloSorteo!
          : vTituloSorteo = "Sorteo sin nombre"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('El gran ganador/a del $vTituloSorteo es...'),
          Padding(
            padding: EdgeInsets.only(top: _deviceHeight! * 0.03),
            child: Text(
              '$ganadorSorteo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => {
                  setState(() {
                    boxSorteo.put(
                        'key_${textEditingController.text}_${ganadorSorteo}',
                        Sorteo.conDatos(
                            tituloSorteo: textEditingController.text,
                            cantParticipantes: listaParticipantes.length,
                            ganadorSorteo: ganadorSorteo));
                    validarEliminarTodos();
                  }),
                  Navigator.pop(context),
                },
            child: const Text('Ok'))
      ],
    );
  }
}
