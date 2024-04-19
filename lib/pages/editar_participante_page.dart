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
        resizeToAvoidBottomInset: false,
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
            // CircularProgressIndicator(),
          ],
        ));
  }

  Widget _filtrosParticipantes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text('Buscar: '),
        SizedBox(
          width: _deviceWidth! * 0.60,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Buscar por nombre',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onChanged: (_nuevoValor) {},
          ),
        ),
        IconButton(onPressed: () => {}, icon: Icon(Icons.list)),
        Text("|"),
        IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.sort_by_alpha,
          ),
        ),
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.numbers),
        ),
      ],
    );
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
              itemCount: 100,
              itemBuilder: (context, indice) {
                return ListTile(
                  title: _contenedorParticipante(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _contenedorParticipante() {
    return Container(
        width: _anchoTabla,
        height: 50,
        decoration: BoxDecoration(border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: _deviceWidth! * 0.07, child: Text('1')),
            Text(
              'Isaias Cordova',
              textAlign: TextAlign.end,
            ),
            IconButton(onPressed: () => {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () => {}, icon: Icon(Icons.delete)),
          ],
        ));
  }

  Widget _btnRegresarInicio() {
    return TextButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            elevation: 4,
            backgroundColor: Colors.black),
        onPressed: () => {},
        child: Text(
          'Regresar a inicio',
          style: TextStyle(color: Colors.white),
        ));
  }
}
