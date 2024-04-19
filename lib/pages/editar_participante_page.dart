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
          children: [
            const Text('Editar participante'),
            _acciones(),
            _filtrosParticipantes(),
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
            icon: Icon(Icons.update))
      ],
      selected: <Acciones>{accionInicial},
      onSelectionChanged: (Set<Acciones> nuevoElemento) {
        setState(() {
          // De esta forma solo un valor estara seleccionado.
          accionInicial = nuevoElemento.first;
        });
      },
    );
  }
}
