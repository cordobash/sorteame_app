import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
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
              _botones()
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
          border:OutlineInputBorder(),
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
        child: Text('${_vTituloSorteo}'),
      ),
    );
  }

  Widget _botones(){

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
          onPressed: () => {},
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

            },
            child: const Text('Realizar sorteo',style: TextStyle(color:Colors.white),))
      ],
    );
  }
}


