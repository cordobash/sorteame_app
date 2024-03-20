// Packages
import 'dart:math';
import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';
// Models
import '../models/Sorteo.dart';
// Vistas adicionales
class AnterioresPage extends StatefulWidget{
  AnterioresPage({Key? key});
  
  @override
  State<StatefulWidget> createState() => _AnterioresPageState();
}

class _AnterioresPageState extends State<AnterioresPage> {
  
  
  List<String> _listaAbecedario = ["a","e","i","o","u"];

  double? _deviceWidth, _deviceHeight;

  @override
  Widget build(BuildContext context) {


    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white10,
      body: (!boxSorteo.isNotEmpty) ? _mensajeDefecto() :   Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Expanded(
          child: 
          ListView.builder(
            itemCount: boxSorteo.length,
            itemBuilder: (context, index) {
            Sorteo sort = boxSorteo.getAt(index);
            // print('Datos actuales: ${sort.tituloSorteo}, ${sort.ganadorSorteo}, ${sort.cantidadParticipantes}');
             ListTile(
              title: const Text('A'),
              // title: _contenedorResultados(tituloSorteo: sort.tituloSorteo, ganadorSorteo: sort.ganadorSorteo, cantidadParticipantes: sort.cantidadParticipantes),
          );},),),
            
      
          Padding(
            padding: const EdgeInsets.only(right: 25,bottom: 20),
            child: Container(
              color:Color.fromRGBO(255, 251, 254, 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () => {},
                    
                    child: IconButton(
                      onPressed: () => showDialog(
                        barrierDismissible: false,
                        context:context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('Esta accion eliminara todos los registros.¿Desea continuar?',style: TextStyle(fontWeight: FontWeight.bold),),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                boxSorteo.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Eliminar todo'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                          ],
                        ) 
                      ),
                      icon: Icon(Icons.delete),
                    ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _contenedorResultados({required tituloSorteo, required ganadorSorteo, required cantidadParticipantes}){
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: Center(
        child: Container(
          height: _deviceHeight! * 0.18,
          width: _deviceWidth! * 0.90,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:Colors.black)
            
          ),
          child:Padding(
            padding: const EdgeInsets.only(left:20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: _deviceWidth,
                  child: Text(tituloSorteo,style: TextStyle(fontWeight: FontWeight.bold,fontSize:25),)),
                Row(
                  children: [
                    Text('Ganador: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    Text("$ganadorSorteo"),
                  ]
                ),
                Row(
                  children: [
                    Text('Numero de participantes: ',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey.shade500),),
                    Text("$cantidadParticipantes",style: TextStyle(color:Colors.grey.shade500),)
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }

// Mensaje por defecto cuando no haya registros
Widget _mensajeDefecto(){
  return Container(
    child: Center(
      child: const Text('Realiza tu primer sorteo!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
  ));
}
}