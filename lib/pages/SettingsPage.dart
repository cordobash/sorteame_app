import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _SettingsPageState({Key? key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Pagina de Ajustes',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          const Text(
            '1',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          )
        ],
      ),
    ));
  }
}
