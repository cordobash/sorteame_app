import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';

class EditarPage extends StatefulWidget {
  EditarPage({Key? key});

  @override
  State<StatefulWidget> createState() => _EditarPageState();
}

enum Acciones { eliminar, modificar }

class _EditarPageState extends State<EditarPage> {
  double? _deviceHeight, _deviceWidth;
  bool _inicialmenteVacia = false;
  bool _statusModoTabla = true;
  String? _nombreBuscar = "";
  int _noCoincidencias = 0;
  List<String> _listaPrueba = [
    "Isaias",
    "Juana",
    "Maria",
    "Olga",
    "Noelia",
    "Pedro",
    "Oscar",
    "Rafael",
    "Roberto",
    "Fatima"
  ];
  List<String> _listaRespaldo = [];
  Map<String, int> _mapaNombres = {};

  Map<String, int> _listaAmapa(List<dynamic> lista, Map<String, int> mapa) {
    for (int i = 0; i < lista.length; i++) {
      mapa[lista[i]] = i;
    }
    return mapa;
  }

  dynamic _accionInicial = Acciones.values.first;

  _EditarPageState({Key? key}) {
    // _inicialmenteVacia = (_listaPrueba.isEmpty) ? true : false;
    _inicialmenteVacia = false;
    _listaRespaldo = [..._listaPrueba];
    _listaAmapa(_listaPrueba, _mapaNombres);
  }

  late double _anchoTabla;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _anchoTabla = _deviceWidth! * 0.95;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Editar participante'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _filtrosParticipantes(),
            (_listaPrueba.isNotEmpty)
                ? (_statusModoTabla)
                    ? _tablaParicipantes()
                    : _modoMosaico()
                // ? _modoMosaico()
                : _mensajeDefecto(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _btnRegresarInicio(),
                _btnDescartarCambios(),
                _btnPruebas()
              ],
            )
            // _modoMosaico()
          ],
        ));
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
      lista[indice] = nuevoNombre;
    } catch (e) {}
  }

  Widget _mensajeDefecto() {
    return SizedBox(
      height: _deviceHeight! * 0.60,
      width: _deviceWidth!,
      child: Center(
        child: Text('Aun no has agregado participantes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
    );
  }

  Widget _filtrosParticipantes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: _deviceWidth! * 0.40,
            height: 50,
            child: TextField(
              enabled: (_listaPrueba.isNotEmpty) ? true : false,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Buscar por nombre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (_) {
                setState(() {
                  _nombreBuscar = _;
                  print('El nombre a buscar es: ${_nombreBuscar}');
                });
              },
            ),
          ),
        ),
        Container(
            color: Colors.black,
            child: IconButton(
                onPressed: () => {
                      setState(() {
                        _statusModoTabla = true;
                      })
                    },
                icon: Icon(Icons.list, color: Colors.white))),
        IconButton(
          onPressed: () => {
            setState(() {
              _statusModoTabla = false;
            })
          },
          icon: Icon(Icons.window),
        ),
        Text("|"),
        IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.sort_by_alpha,
          ),
        ),
        IconButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () => {},
          icon: Icon(Icons.numbers, color: Colors.white),
        ),
      ],
    );
  }

  Future<void> _tiempoCarga() {
    return Future.delayed(Duration(seconds: 2));
  }

  Widget _tablaParicipantes() {
    return Container(
      height: _deviceHeight! * 0.65,
      // NoParticipante - Nombre - [Accion]
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
                Text('Id'),
                Text('Nombre'),
                Text('Modificar'),
                Text('Eliminar')
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              // itemCount: _listaPrueba.length,
              itemCount: (_nombreBuscar!.isNotEmpty)
                  ? _noCoincidencias
                  : _listaPrueba.length,
              itemBuilder: (context, indice) {
                return ListTile(
                  title:
                      _contenedorParticipante(_listaPrueba[indice], indice + 1),
                );
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
            Text('${indice.toString()}'),
            Text(
              '${nombreParticipante}',
              textAlign: TextAlign.end,
            ),
            IconButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              _dialogEditarPersonaje(indice - 1))
                    },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () => {
                      _eliminarParticipante(indice - 1, _listaPrueba),
                    },
                icon: Icon(Icons.delete)),
          ],
        ));
  }

  Widget _btnRegresarInicio() {
    return SizedBox(
        height: 60,
        child: TextButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              elevation: 4,
              backgroundColor: Colors.black),
          onPressed: () => {},
          child: Icon(Icons.home, color: Colors.white),
        ));
  }

  Widget _btnPruebas() {
    return SizedBox(
        height: 60,
        child: TextButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              elevation: 4,
              backgroundColor: Colors.black),
          onPressed: () => {print('Nombre a buscar: ${_nombreBuscar}')},
          child: Icon(Icons.home, color: Colors.white),
        ));
  }

  Widget _accionesRealizar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text('Accion a realizar: '), _segmentedButtons()],
    );
  }

  Widget _modoMosaico() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _accionesRealizar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 360,
              height: 500,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: GridView.builder(
                    itemCount: _listaPrueba.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) =>
                        _mosaicoContenedorParticipantes(_listaPrueba[index]),
                  ))
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _mosaicoContenedorParticipantes(String _participante) {
    return SizedBox(
      height: 30,
      width: 10,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextButton(
          onPressed: () => {},
          child: Text(
            '${_participante}',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            backgroundColor: Colors.black,
          ),
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
          print('El elemento que esta seleccionado es: $_accionInicial');
        });
      },
    );
  }

  Widget _btnDescartarCambios() {
    return Opacity(
      opacity:
          (_listaPrueba.isNotEmpty && _inicialmenteVacia == false) ? 1.0 : 0.5,
      child: SizedBox(
        height: 60,
        child: TextButton(
          // child: Text('Descartar cambios', style: TextStyle(color: Colors.white)),
          child: Icon(Icons.restore, color: Colors.white),
          onPressed: () => {
            (_listaPrueba.isNotEmpty && _inicialmenteVacia == false)
                ? showDialog(
                    context: context,
                    builder: (context) => _dialogDescartarCambios())
                : null
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              )),
        ),
      ),
    );
  }

  Widget _dialogEditarPersonaje(int indice) {
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
              hintText: _listaPrueba[indice],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text('Nuevo nombre'),
          TextField(
            enabled: true,
            onChanged: (_) => _nuevoNombre = _,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Nuevo nombre',
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
            _actualizarParticipante(indice, _listaPrueba, _nuevoNombre!);
            Navigator.pop(context);
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
              // _listaPrueba = _listaRespaldo;
              _listaPrueba = [];
              _listaPrueba = [..._listaRespaldo];
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
