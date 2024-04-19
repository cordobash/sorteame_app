import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EditarPage extends StatefulWidget {
  EditarPage({Key? key});

  @override
  State<StatefulWidget> createState() => _EditarPageState();
}

enum Acciones { eliminar, modificar }

class _EditarPageState extends State<EditarPage> {
  double? _deviceHeight, _deviceWidth;
  late double _anchoTabla;
  Acciones accionInicial = Acciones.eliminar;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _anchoTabla = _deviceWidth! * 0.95;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar participante'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _filtrosParticipantes(),
            _tablaParicipantes(),
            _btnRegresarInicio()
          ],
        ));
  }

  Widget _acciones() {
    return Row(
      children: [
        Text('Accion a realizar: '),
        _segmentedButtons(),
      ],
    );
  }

  Widget _filtrosParticipantes() {
    return Container(
      width: _deviceWidth!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Buscar: '),
          SizedBox(
            width: _deviceWidth! * 0.50,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (_nuevoValor) {},
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.sort_by_alpha,
            ),
          ),
          IconButton(onPressed: () => {}, icon: Icon(Icons.numbers))
        ],
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
      selected: <Acciones>{accionInicial},
      onSelectionChanged: (Set<Acciones> nuevoElemento) {
        setState(() {
          // De esta forma solo un valor estara seleccionado.
          accionInicial = nuevoElemento.first;
          print('El elemento que esta seleccionado es: $accionInicial');
        });
      },
    );
  }

  Widget _tablaParicipantes() {
    return SizedBox(
      height: _deviceHeight! * 0.60,
      // NoParticipante - Nombre - [Accion]
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Container(
              width: _anchoTabla,
              height: 50,
              decoration: BoxDecoration(border: Border.all()),
              // Cabecera de la tabla
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Id'), Text('Nombre'), Text('Accion')],
              ),
            ),
            _contenedorParticipante(),
            _contenedorParticipante(),
            _contenedorParticipante(),
          ],
        ),
      ),
    );
  }

  Widget _contenedorParticipante() {
    return Container(
        width: _anchoTabla,
        height: 50,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(),
          left: BorderSide(),
          right: BorderSide(),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: _deviceWidth! * 0.07, child: Text('1')),
            Text(
              'Juan Manuel Carmona',
              textAlign: TextAlign.end,
            ),
            Icon(Icons.delete),
          ],
        ));
  }

  Widget _btnRegresarInicio() {
    return TextButton(
        style: ElevatedButton.styleFrom(
            elevation: 4, backgroundColor: Colors.black),
        onPressed: () => {},
        child: Text(
          'Regresar a inicio',
          style: TextStyle(color: Colors.white),
        ));
  }
}
