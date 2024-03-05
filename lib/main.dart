import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';

void main(){
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget{
  
  MyApp({Key? key});
  @override
  State<StatefulWidget> createState() => _MyAppState() ;
}

class _MyAppState extends State<MyApp>{
    double? _deviceWidth, _deviceHeight;
    String? _vTituloSorteo;
    // Aqui se almacenara a cada uno de los participantes.
    List<String?> _listaParticipantes = List.empty(growable: true);
    String? _nuevoParticipante;
    String? _ganadorSorteo;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('AppSorteos', style: TextStyle(
            color:Colors.white
          ),),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Realiza tus sorteos en nuestra app!',style: TextStyle(fontWeight: FontWeight.w700)),
              _tituloSorteo(),
              const Text('Participantes'),
              _contenedorListaParticipantes(),
              _botones(context)
            ],
          )
        )
      ),
    );
  }

  Widget _tituloSorteo(){
    return SizedBox(
      width: _deviceWidth! * 0.80,
      child: TextField(
        onChanged: (_){
            setState(() {
              _vTituloSorteo = _;
            });
            print('El titulo del sorteo es: $_vTituloSorteo');
        },
        obscureText: false,
        decoration: InputDecoration(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Titulo del sorteo'
        )
      )
    );
  }

  Widget _contenedorListaParticipantes(){
    return Container(
      height: _deviceHeight! * 0.40,
      width: _deviceWidth! * 0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding:EdgeInsets.only(left: _deviceWidth! * 0.015,top: _deviceHeight! * 0.01),
        child: Text('$_listaParticipantes'),
      ),
    );
  }


  void calcularGanador(){
    Random ran = new Random();
    // Tendra como rango maximo hasta la longitud maxima del arreglo en donde estan almacenado los participantes
    //                          1 - capacidad actual del arreglo
    int? indice = ran.nextInt(_listaParticipantes.length);
    _ganadorSorteo = _listaParticipantes[indice];

  }
  Widget _botones(dynamic context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Boton anadir participantes
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(10, 200, 247, 1.0),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Añadir participante'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('En el siguiente campo anote el nombre del participante: '),
                  Padding(
                    padding: EdgeInsets.only(top:_deviceHeight! * 0.03),
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
                  onPressed: () =>{
                    Navigator.pop(context),
                    _listaParticipantes.add(_nuevoParticipante),
                    print(_listaParticipantes)
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                    onPressed: () =>{
                      // Se devuelve a inicio y no agrega a la lista el participante
                      Navigator.pop(context)
                    },
                    child: const Text('Cancelar'))
              ],
            )
          ),
          child: const Text('Añadir participante',style: TextStyle(color:Colors.white),),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(254, 31, 92, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
            onPressed: () => {
            calcularGanador(),
              showDialog(
                barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('$_vTituloSorteo'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('El gran ganador/a del sorteo $_vTituloSorteo es...'),
                        Padding(
                          padding: EdgeInsets.only(top: _deviceHeight! * 0.03),
                          child: Text('$_ganadorSorteo',style: TextStyle(fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'))
                    ],

                  )

              )
            },
                child: const Text('Realizar sorteo',style: TextStyle(color:Colors.white),))
      ],
    );
  }
}


