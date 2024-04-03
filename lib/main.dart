// Paquetes de la libreria o externos.
import 'dart:math';
import 'package:app_sorteos/pages/PostSorteoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Vistas.
import 'package:app_sorteos/pages/SettingsPage.dart';
import 'package:app_sorteos/models/Sorteo.dart';
import 'package:app_sorteos/pages/AboutPage.dart';
import 'package:app_sorteos/pages/AnterioresPage.dart';

// Modelos.
import 'package:app_sorteos/models/boxes.dart';

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

  // Aqui se almacenara a cada uno de los participantes.
  List<String?> _listaParticipantes = List.empty(growable: true);
  String? _nuevoParticipante;

  // String? ganadorSorteo;
  late int _selectedIndex = 0;
  
  static const TextStyle optionStyle =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 25);

  // Manejo de campos vacios
  bool? _campoVacioTitulo = true;
  Color _colorContenedorBorder = Colors.grey;
  bool? _visibleLabel = false;

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
        _listaParticipantes = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData.light(),
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
                  const Text('Lista de participantes'),
                  _visibleLabel! ? Text('Añade al menos 1 participante', style: TextStyle(color: Colors.red,fontSize: 15),): SizedBox(),
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
        floatingActionButton: (visibleFloating!)
            ? ExpandableFab(
                distance: 112,
                children: [
                  ActionButton(
                    onPressed: () => {
                      showDialog(
                        context: context, builder: (BuildContext context) => _alertAnadirArchivo())
                    },
                    icon: const Icon(Icons.insert_drive_file),
                  ),
                  ActionButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.plus_one_sharp),
                  ),
                ],
              )
            : null,
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
                if (vTituloSorteo!.length == 0) {
                  _campoVacioTitulo = true;
                } else {
                  _campoVacioTitulo = false;
                }
              });
            },
            obscureText: false,
            decoration: InputDecoration(
                errorText: (vTituloSorteo!.length == 0)
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
            Text('$_listaParticipantes'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_listaParticipantes.length}'),
                IconButton(
                    onPressed: () => {
                          setState(() {
                            _listaParticipantes = [];
                          })
                        },
                    icon: Icon(Icons.delete))
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
        int? indice = ran.nextInt(_listaParticipantes.length);
        ganadorSorteo = _listaParticipantes[indice];
        setState(() {
          visibleFloatingAnteriores = true;
          _colorContenedorBorder = Colors.grey;
          _visibleLabel = false;
        print('se metio al try');
    
        });
    } catch (e) {
      print('Se metio al catch');
      setState(() {
        _colorContenedorBorder = Colors.red;
        _visibleLabel = true;
      });
    }

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
                          setState(() {
                            _listaParticipantes.add(_nuevoParticipante);
                            _visibleLabel = false;
                            _colorContenedorBorder = Colors.grey;
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
                  )),
          child: const Text(
            'Añadir participante',
            style: TextStyle(color: Colors.white),
          ),
        ),
        (_campoVacioTitulo == true)
            ? SizedBox()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(254, 31, 92, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () => {
                      calcularGanador(),
                      boxSorteo.put(
                          'key_${vTituloSorteo}_${ganadorSorteo}',
                          Sorteo.conDatos(
                              tituloSorteo: vTituloSorteo,
                              cantParticipantes: _listaParticipantes.length,
                              ganadorSorteo: ganadorSorteo)),
                      activarAnimacion
                          ? cambiarAnimada()
                          : showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text((vTituloSorteo != null)
                                    ? vTituloSorteo!
                                    : vTituloSorteo = "Sorteo sin nombre"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'El gran ganador/a del $vTituloSorteo es...'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: _deviceHeight! * 0.03),
                                      child: Text(
                                        '$ganadorSorteo',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                                      tituloSorteo:
                                                          vTituloSorteo,
                                                      cantParticipantes:
                                                          _listaParticipantes
                                                              .length,
                                                      ganadorSorteo:
                                                          ganadorSorteo));
                                              validarEliminarTodos();
                                            }),
                                            Navigator.pop(context),
                                          },
                                      child: const Text('OK'))
                                ],
                              ),
                            ),
                    },
                child: const Text(
                  'Realizar sorteo',
                  style: TextStyle(color: Colors.white),
                )),
      ],
    );
  }

  Widget _alertError() {
    return AlertDialog(
      title: const Text('Error'),
      content: const Text('Se necesita agregar al menos a 1 participante'),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context), child: const Text('Ok'))
      ],
    );
  }

  Widget _alertAnadirArchivo(){
    return AlertDialog(
      title: Text('Añade los participantes de tu sorteo desde un archivo'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('El tipo de archivo admitido para esta operacion es solamente en formato .txt'),
          Text((boxSorteo.name.isNotEmpty) ? boxSorteo.name : 'Ningun archivo cargado' ),
          ElevatedButton(onPressed: () => {}, child: Text('Selecciona un archivo'))
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => {},
          child: Text('Salir'),
        )
      ],
    );
  }
}
