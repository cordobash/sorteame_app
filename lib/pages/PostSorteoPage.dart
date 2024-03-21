import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
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
        body: Center(
          child: Countdown(
            seconds: 3, 
            build: (BuildContext context,double tiempo) => Text(tiempo.toString()),
            onFinished: () => {
              setState(() {
                tiempoFuera = true;
              })
            },
            ),
          ),
        );
  }
}

// Cargamos la otra view
class ResultadosPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: const Text('Felicidades al ganador!'),
      ),
    );
  }
}