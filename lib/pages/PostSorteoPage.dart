import 'package:app_sorteos/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:app_sorteos/models/Sorteo.dart';
class PostPage extends StatefulWidget{
  PostPage({Key? key});
  @override
  State<StatefulWidget> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool tiempoFuera = false;

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return tiempoFuera ? ResultadosPage() :
       Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Tiempo restante para conocer al ganador!',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Countdown(
                seconds: 3, 
                build: (BuildContext context,double tiempo) => Text(tiempo.toInt().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                onFinished: () => {
                  setState(() {
                    tiempoFuera = true;
                  })
                },
                ),
            ],
          ),
          ),
        );
  }
}

// Cargamos la otra view
class ResultadosPage extends StatelessWidget{
    Sorteo sorteo = new Sorteo();
  double? _deviceWidth,_deviceHeight;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: SizedBox(
          height: _deviceHeight! * 0.45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Felicidades al ganador!'),
              Container(
                width: _deviceWidth! * 0.50,
                height: _deviceHeight! * 0.07,
                decoration: BoxDecoration(
                  color: Colors.pink.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    child: Text("${sorteo.getGanador()}", style: TextStyle(color:Colors.white, fontSize: 25),)),
                ),
              ),
              Text('Por haber sido el ganador en el sorteo de: '),
              Container(
                width: _deviceWidth! * 0.50,
                height: _deviceHeight! * 0.07,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${sorteo.getTitulo()}",style: TextStyle(color:Colors.white,fontSize: 20),),
                    ],
                  )),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}