import 'package:flutter/material.dart';

void main(){

}

class MyApp extends StatefulWidget{
  
  MyApp({Key? key});
  @override
  State<StatefulWidget> createState() => _MyAppState() ;
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body:const Text('Test text'),
      ),
    );
  }
}