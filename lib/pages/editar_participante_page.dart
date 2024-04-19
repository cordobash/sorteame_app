import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EditarPage extends StatefulWidget {
  EditarPage({Key? key});

  @override
  State<StatefulWidget> createState() => _EditarPageState();
}

enum Acciones { eliminar, modificar }

class _EditarPageState extends State<EditarPage> {
  Acciones accionInicial = Acciones.eliminar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar participante'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Editar participante'),
            _acciones(),
            _filtrosParticipantes(),
            _tablaParicipantes()
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
    return Row(
      children: [
        Text('Filtra por: '),
        SizedBox(
          width: 200,
          height: 30,
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onChanged: (_nuevoValor) {},
          ),
        )
      ],
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
      // NoParticipante - Nombre - [Accion]
      child: Column(
        children: [
          // Cabecera de la tabla
          Container(
            height: 50,
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('No.Participantes'),
                Text('Nombre'),
                Text('Accion')
              ],
            ),
          )
        ],
      ),
    );
  }
}
