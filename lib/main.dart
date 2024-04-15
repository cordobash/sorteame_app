// main.dart: Archivo principal de ejecucion.
// Paquetes de la libreria o externos.
import 'dart:math';
import 'package:app_sorteos/pages/post_sorteo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Vistas.
import 'package:app_sorteos/pages/settings_page.dart';
import 'package:app_sorteos/models/Sorteo.dart';
import 'package:app_sorteos/pages/about_page.dart';
import 'package:app_sorteos/pages/anteriores_page.dart';

// Modelos.
import 'package:app_sorteos/models/boxes.dart';
import 'package:app_sorteos/models/Archivo.dart';

// Floating
import './widgets/expandable_floating.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(SorteoAdapter());
  // Abriendo la box
  boxSorteo = await Hive.openBox<Sorteo>('sorteoBox');

  runApp(MaterialApp(
      initialRoute: '/',
      routes: {'/crpage': (context) => PostPage()},
      home: MyApp()));
}

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

  // Manejo de campos vacios
  Color _colorContenedorBorder = Colors.grey;
  bool? _visibleLabel = false;
  List<Color> _gradienteRosaRojoAzul = [
    Colors.pink,
    Colors.red.shade500,
    Colors.pink.shade400,
    Colors.pink.shade600,
    Colors.blue.shade900,
  ];

  final List<String> _titulosSuperior = [
    "Principal",
    "Resultados anteriores",
    "Ajustes",
    "Acerca de mi"
  ];

  List<Widget> _listaWidgets = [
    Text(
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
      visibleFloating = (indice == 0) ? true : false;
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex != 0) {
      vTituloSorteo = '';
    }
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            '${_titulosSuperior[_selectedIndex]}',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: (_selectedIndex == 0)
            ? _menuPrincipal()
            : _listaWidgets[_selectedIndex],
        drawer: Drawer(
          shape: ShapeBorder.lerp(null, null, 15.0),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          semanticLabel: 'Drawer',
          surfaceTintColor: Colors.yellow,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: const Text(
                  'Menu de opciones',
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
                  leading: Icon(
                    Icons.menu,
                    color: (_selectedIndex == 0)
                        ? Colors.pink
                        : Colors.pink.shade900,
                  ),
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
                  leading: Icon(Icons.history,
                      color: (_selectedIndex == 1)
                          ? Colors.pink
                          : Colors.pink.shade900),
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
                  leading: Icon(Icons.settings,
                      color: (_selectedIndex == 2)
                          ? Colors.grey.shade900
                          : Colors.pink.shade900),
                  onTap: () {
                    setState(() {
                      cambiarPagina(2);
                      Navigator.pop(context);
                    });
                  },
                  selected: (_selectedIndex == 2) ? true : false,
                  selectedColor: Colors.grey.shade900,
                  title: const Text('Ajustes'),
                );
              }),
              Builder(builder: (context) {
                return ListTile(
                  leading: Icon(Icons.message,
                      color: (_selectedIndex == 3)
                          ? Colors.blue
                          : Colors.pink.shade900),
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
        floatingActionButton: (visibleFloating)
            ? ExpandableFab(
                distance: 112,
                children: [
                  ActionButton(
                    onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _alertAnadirArchivo(archivo)),
                    },
                    color: Colors.pink.shade900,
                    icon: const Icon(Icons.insert_drive_file),
                  ),
                  ActionButton(
                    onPressed: () => {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              _alertAnadirUnParticipante())
                    },
                    color: Colors.pink.shade900,
                    icon: const Icon(Icons.plus_one_sharp),
                  ),
                ],
              )
            : null,
      ),
    );
  }

  Widget _menuPrincipal() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('Realiza tus sorteos en nuestra app!',
              style: TextStyle(fontWeight: FontWeight.w700)),
          _tituloSorteo(),
          const Text('Lista de participantes'),
          _visibleLabel!
              ? Text(
                  'Añade al menos 1 participante',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                )
              : SizedBox(),
          _contenedorListaParticipantes(),
          _btnRealizarSorteo(context)
        ],
      ),
    );
  }

  Widget _tituloSorteo() {
    return SizedBox(
        width: _deviceWidth! * 0.80,
        child: TextField(
            onChanged: (_) {
              setState(() {
                vTituloSorteo = _;
                if (vTituloSorteo!.isEmpty) {
                  _mostrarErrorText = true;
                } else {
                  _mostrarErrorText = false;
                }
              });
            },
            onSubmitted: (_nuevoValor) => {vTituloSorteo = _nuevoValor},
            obscureText: false,
            decoration: InputDecoration(
                errorText: (_mostrarErrorText)
                    ? 'El titulo del sorteo no puede estar vacio'
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
          children: [
            Text('${listaParticipantes.join(', ')}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${listaParticipantes.length}'),
                IconButton(
                    onPressed: () => {
                          setState(() {
                            // Vaciamos la lista general
                            listaParticipantes = [];
                          })
                        },
                    icon: Icon(Icons.delete)),
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
        print('titulo sorteo: ${vTituloSorteo.toString().codeUnitAt(0)}');
      });
    } catch (e) {
      setState(() {
        _colorContenedorBorder = Colors.red;
        _visibleLabel = true;
        print('titulo sorteo: ${vTituloSorteo.toString().codeUnitAt(0)}');
      });
    }
  }

  Widget _btnRealizarSorteo(dynamic context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: _deviceHeight! * 0.06,
          child: Opacity(
            opacity: (vTituloSorteo.isNotEmpty && listaParticipantes.isNotEmpty)
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
                  if (listaParticipantes.isNotEmpty && vTituloSorteo.isNotEmpty)
                    {
                      boxSorteo.put(
                          'key_${vTituloSorteo}_${ganadorSorteo}',
                          Sorteo.conDatos(
                              tituloSorteo: vTituloSorteo,
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
                        vTituloSorteo.isEmpty ||
                                vTituloSorteo.toString().codeUnitAt(0) == 32
                            ? _mostrarErrorText = true
                            : _mostrarErrorText = false;
                      })
                    }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                        (vTituloSorteo!.isNotEmpty &&
                                listaParticipantes.isNotEmpty)
                            ? Icons.play_circle
                            : Icons.play_disabled,
                        color: Colors.white),
                    Text(
                      'Realizar sorteo',
                      style: TextStyle(color: Colors.white),
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

  Widget _alertAnadirArchivo(Archivo archivo) {
    String _nombreArchivoSeleccionado =
        archivo.getNombreArchivo() ?? "Ningun archivo seleccionado";
    return AlertDialog(
      title:
          const Text('Añade los participantes de tu sorteo desde un archivo'),
      content: SizedBox(
        height: _deviceHeight! * 0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
                'El tipo de archivo admitido para esta operacion es solamente en formato .txt'),
            Text("${_nombreArchivoSeleccionado}"),
            // "${_nombreArchivoSeleccionado.substring(1, _nombreArchivoSeleccionado.length - 1)}"),
            ElevatedButton(
                onPressed: () => {
                      archivo.abrirArchivo(),
                      setState(() {
                        _nombreArchivoSeleccionado =
                            archivo.getNombreArchivo().toString();
                      })
                    },
                child: Text('Selecciona un archivo'))
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
          child: const Text('Salir'),
        )
      ],
    );
  }

  Widget _alertAnadirUnParticipante() {
    return AlertDialog(
      title: const Text('Añadir participante'),
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
            setState(() {
              listaParticipantes.add(_nuevoParticipante!);
              if (listaParticipantes.isNotEmpty) {
                _colorContenedorBorder = Colors.grey;
                _visibleLabel = false;
              } else {
                _colorContenedorBorder = Colors.red;
                _visibleLabel = true;
              }
            })
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
                        'key_${vTituloSorteo}_${ganadorSorteo}',
                        Sorteo.conDatos(
                            tituloSorteo: vTituloSorteo,
                            cantParticipantes: listaParticipantes.length,
                            ganadorSorteo: ganadorSorteo));
                    validarEliminarTodos();
                  }),
                  Navigator.pop(context),
                },
            child: const Text('OK'))
      ],
    );
  }
}
