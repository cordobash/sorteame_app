import 'dart:math';

import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditarPage extends StatefulWidget {
  EditarPage({Key? key});

  @override
  State<StatefulWidget> createState() => _EditarPageState();
}

enum Acciones { eliminar, modificar }

TextEditingController textEditingController = TextEditingController();

class _EditarPageState extends State<EditarPage> {
  double? _deviceHeight, _deviceWidth;
  bool _statusModoTabla = true;
  String _nombreBuscar = "";
  List<String> _listaCoincidencias = [];
  int _indiceEnum = 0;
  bool _cargando = false;
  dynamic _accionInicial = Acciones.values.first;
  bool _checkBoxConfirmacionPresionado = false;

  bool _mostrarErrorText = false;

  _EditarPageState({Key? key}) {}

  late double _anchoTabla;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _anchoTabla = _deviceWidth! * 0.95;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        setState(() {
          listaParticipantes = listaParticipantes;
        });
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              'Editar participante',
              style: TextStyle(fontFamily: 'Manrope'),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _filtrosParticipantes(),
              (_cargando)
                  ? SizedBox(
                      width: _deviceWidth! * 0.60,
                      height: _deviceHeight! * 0.65,
                      child: Center(
                          child: SizedBox(child: CircularProgressIndicator())))
                  : (listaParticipantes.isNotEmpty)
                      ? (_statusModoTabla)
                          ? _tablaParicipantes()
                          : _modoMosaico()
                      : _mensajeDefecto(),
            ],
          )),
    );
  }

  void _eliminarParticipante(int indice, List<String> lista) {
    setState(() {
      try {
        lista.removeAt(indice);
      } catch (e) {
        print(e);
      }
    });
  }

  void _actualizarParticipante(
      int indice, List<String> lista, String nuevoNombre) {
    try {
      setState(() {
        lista[indice] = nuevoNombre;
      });
    } catch (e) {}
  }

  Widget _mensajeDefecto() {
    return SizedBox(
      height: _deviceHeight! * 0.70,
      width: _deviceWidth!,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: _deviceWidth!,
              child: Text(
                'Aun no has agregado participantes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            (_deviceHeight! >= 475)
                ? Image(
                    width: 275,
                    height: 300,
                    image: AssetImage('lib/src/images/not_found.png'),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  void _buscarEnLista(String cadena, List<String> lista) {
    // Vaciamos la lista de coincidencias pasadas
    _listaCoincidencias = [];
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].contains(cadena)) {
        _listaCoincidencias.add(cadena);
      }
    }
  }

  Widget _filtrosParticipantes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: _deviceWidth! * 0.60,
            height: 55,
            child: TextField(
              enabled: (listaParticipantes.isNotEmpty) ? true : false,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Buscar por nombre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (_) {
                setState(() {
                  _nombreBuscar = _;
                  print('El nombre a buscar es: ${_nombreBuscar}');
                  print(
                      'El numero de coincidencias para el nombre ${_nombreBuscar} fueron de ${_actualizarTablaFiltro(_nombreBuscar, listaParticipantes).length} en la posicion: ${_actualizarTablaFiltro(_nombreBuscar, listaParticipantes)}');
                });
              },
              onSubmitted: (_) {
                setState(() {
                  _buscarEnLista(_, listaParticipantes);
                });
              },
            ),
          ),
        ),
        Container(
            color: (_statusModoTabla) ? colorGlobal.shade900 : Colors.white,
            child: IconButton(
                onPressed: () => {
                      setState(() {
                        _cargando = true;
                        _tiempoCarga().whenComplete(() => setState(() {
                              _cargando = false;
                            }));
                        _statusModoTabla = true;
                      })
                    },
                icon: Icon(Icons.list,
                    color: (_statusModoTabla) ? Colors.white : Colors.black))),
        Container(
          color: (!_statusModoTabla) ? colorGlobal.shade900 : Colors.white,
          child: IconButton(
            onPressed: () => {
              setState(() {
                _cargando = true;
                _tiempoCarga().whenComplete(() => setState(() {
                      _cargando = false;
                    }));
                _statusModoTabla = false;
              })
            },
            icon: Icon(Icons.window,
                color: (!_statusModoTabla) ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }

  Color seleccionarColor(color) {
    Random ran = new Random();
    List<Color> _listaColores = [
      color.shade500,
      color.shade900,
      color.shade700
    ];
    int indice = ran.nextInt(_listaColores.length);
    return _listaColores[indice];
  }

  Future<void> _tiempoCarga() {
    return Future.delayed(Duration(seconds: 1));
  }

  Widget _tablaParicipantes() {
    List<int> _indices = [
      ..._actualizarTablaFiltro(_nombreBuscar, listaParticipantes)
    ];
    return Container(
      height: _deviceHeight! * 0.65,
      // NoParticipante - Nombre - [Acciones]
      child: Column(
        children: [
          Container(
            width: _anchoTabla,
            height: 50,
            decoration: BoxDecoration(border: Border.all()),
            // Cabecera de la tabla
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Nombre participante'),
                Text('Modificar'),
                Text('Eliminar')
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (_nombreBuscar.isEmpty)
                  ? listaParticipantes.length
                  : _actualizarTablaFiltro(_nombreBuscar, listaParticipantes)
                      .length,
              itemBuilder: (context, indice) {
                return ListTile(
                    title: (_nombreBuscar.isEmpty)
                        ? _contenedorParticipante(
                            listaParticipantes[indice], indice)
                        : _contenedorParticipante(
                            listaParticipantes[_indices[indice]],
                            _indices[indice]));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _contenedorParticipante(String nombreParticipante, int indice) {
    return Container(
        width: _anchoTabla,
        height: 50,
        decoration: BoxDecoration(border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                '${nombreParticipante}',
                textAlign: TextAlign.end,
              ),
            ),
            IconButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) =>
                                    _dialogEditarPersonaje(indice, setState));
                          })
                    },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () => {
                      !mostrarDialogoConfirmacion
                          ? _eliminarParticipante(indice, listaParticipantes)
                          : showDialog(
                              context: context,
                              builder: (context) => StatefulBuilder(
                                  builder: (context, setState) =>
                                      _dialogEliminarParticipante(
                                          indice, setState)))
                    },
                icon: Icon(Icons.delete)),
          ],
        ));
  }

  List<int> _actualizarTablaFiltro(
      String cadena, List<String> listaParticipantes) {
    List<int> _listaIndices = [];
    for (int i = 0; i < listaParticipantes.length; i++) {
      if (listaParticipantes[i].contains(cadena)) {
        _listaIndices.add(i);
      }
    }
    return _listaIndices;
  }

  Widget _accionesRealizar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text('Accion a realizar: '), _segmentedButtons()],
    );
  }

  void _generadorElementos(List<dynamic> lista, int inicio, int fin) {
    for (int i = inicio; i <= fin; i++) {
      lista.add(i);
    }
  }

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

  Widget _modoMosaico() {
    List<int> _indices = [
      ..._actualizarTablaFiltro(_nombreBuscar, listaParticipantes)
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _accionesRealizar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: _deviceWidth! * 1.0,
              height: _deviceHeight! * 0.60,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: GridView.builder(
                          itemCount: (_nombreBuscar.isEmpty)
                              ? listaParticipantes.length
                              : _actualizarTablaFiltro(
                                      _nombreBuscar, listaParticipantes)
                                  .length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      (_deviceWidth! < 500) ? 2 : 3),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ListTile(
                                  title: (_nombreBuscar.isEmpty)
                                      ? _mosaicoContenedorParticipantes(
                                          listaParticipantes[index], index)
                                      : _mosaicoContenedorParticipantes(
                                          listaParticipantes[_indices[index]],
                                          index)),
                            );
                          }))
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _mosaicoContenedorParticipantes(String _participante, indice) {
    return Container(
      height: 200,
      child: TextButton(
        onPressed: () => {
          if (_indiceEnum == 0)
            {
              setState(() {
                !mostrarDialogoConfirmacion
                    ? _eliminarParticipante(indice, listaParticipantes)
                    : showDialog(
                        context: context,
                        builder: (context) => StatefulBuilder(
                            builder: (context, setState) =>
                                _dialogEliminarParticipante(indice, setState)));
              })
            }
          else if (_indiceEnum == 1)
            {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, setState) =>
                            _dialogEditarPersonaje(indice, setState));
                  })
            }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          _participante,
          style: TextStyle(color: Colors.white, overflow: TextOverflow.fade),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorGlobal.shade500,
            colorGlobal.shade600,
            colorGlobal.shade700,
            colorGlobal.shade900
          ],
        ),
      ),
    );
  }

  Widget _segmentedButtons() {
    return SegmentedButton<Acciones>(
      segments: const <ButtonSegment<Acciones>>[
        ButtonSegment<Acciones>(
          value: Acciones.eliminar,
          label: Text('Eliminar'),
          icon: Icon(Icons.delete),
        ),
        ButtonSegment<Acciones>(
            value: Acciones.modificar,
            label: Text('Modificar'),
            icon: Icon(Icons.edit))
      ],
      selected: <Acciones>{_accionInicial},
      onSelectionChanged: (Set<Acciones> nuevoElemento) {
        setState(() {
          // De esta forma solo un valor estara seleccionado.
          _accionInicial = nuevoElemento.first;
          _indiceEnum = (_indiceEnum == 0) ? 1 : 0;
        });
      },
    );
  }

  Widget _dialogEliminarParticipante(int indice, state) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${listaParticipantes[indice]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Sera eliminado(a) del sorteo; ¿Deseas continuar?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: (!_checkBoxConfirmacionPresionado)
                    ? Icon(Icons.check_box_outline_blank)
                    : Icon(Icons.check_box),
                onPressed: () => {
                  state(() {
                    _checkBoxConfirmacionPresionado =
                        !_checkBoxConfirmacionPresionado;
                  })
                },
              ),
              LimitedBox(
                  maxHeight: 200,
                  maxWidth: _deviceWidth! * 0.50,
                  child: Text(
                    'No volver a mostrar este dialogo',
                    maxLines: 2,
                  ))
            ],
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => {
                  setState(() {
                    if (_checkBoxConfirmacionPresionado) {
                      mostrarDialogoConfirmacion = false;
                    }
                    _eliminarParticipante(indice, listaParticipantes);
                    Navigator.pop(context);
                  })
                },
            child: Text("Ok")),
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancelar'))
      ],
    );
  }

  Widget _dialogEditarPersonaje(int indice, state) {
    String? _nuevoNombre;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Nombre actual'),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: listaParticipantes[indice],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text('Nuevo nombre'),
          TextField(
            controller: textEditingController,
            enabled: true,
            onChanged: (_) {
              _nuevoNombre = textEditingController.text;
              state(() {
                (textEditingController.text.isEmpty ||
                        _validarCaracteres(textEditingController.text) ||
                        textEditingController.text.codeUnitAt(0) == 32)
                    ? _mostrarErrorText = true
                    : _mostrarErrorText = false;
              });
            },
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Nuevo nombre',
              errorText:
                  (_mostrarErrorText) ? 'El nuevo nombre no es valido' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _nuevoNombre = textEditingController.text;
            if (_nuevoNombre!.isNotEmpty &&
                _validarCaracteres(_nuevoNombre!) == false &&
                _nuevoNombre!.codeUnitAt(0) != 32) {
              _actualizarParticipante(
                  indice, listaParticipantes, _nuevoNombre!);
              Navigator.pop(context);
              textEditingController.text = "";
            } else {
              null;
            }
          },
          child: Text('Ok'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        )
      ],
    );
  }

  Widget _dialogDescartarCambios() {
    return AlertDialog(
      content: Text(
          'Esto descartara cualquier cambio hecho a la lista de participantes y volvera a su estado previo,¿Desea continuar?'),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              // listaParticipantes = listaParticipantes;
              listaParticipantes = [];
              listaParticipantes = [...listaParticipantes];
              Navigator.pop(context);
            });
          },
          child: Text('Ok'),
        ),
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancelar'))
      ],
    );
  }
}
