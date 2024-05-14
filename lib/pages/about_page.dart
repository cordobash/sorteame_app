import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:mailto/mailto.dart';
import 'package:app_sorteos/models/boxes.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key});

  TextStyle _estiloCabecera = TextStyle(
      color: Colors.grey.shade700, fontSize: 18, fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Desarrollado por:',
            style: _estiloCabecera,
          ),
          Text(
            'Isaias Gerardo Cordova Palomares',
            style: _estiloCabecera,
          ),
          Text('(Desarrollador de Software)'),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                color: colorGlobal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Hagamos realidad tus ideas!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              'Vias de contacto',
              style: TextStyle(color: Colors.grey.shade800, fontSize: 17),
            ),
          ),
          // Redes sociales
          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _contenedorViaContacto(
                    SimpleIcons.github,
                    () => _launchUrl(
                          'https://github.com/IGerardoJR',
                        ),
                    Colors.black),
                _contenedorViaContacto(
                    SimpleIcons.linkedin,
                    () => _launchUrl(
                        'https://www.linkedin.com/in/isaias-gerardo-cordova-palomares-1586a2244/'),
                    Colors.blue),
                _contenedorViaContacto(SimpleIcons.gmail, () => _launchMailTo(),
                    Colors.orange.shade900),
                _contenedorViaContacto(
                    SimpleIcons.internetexplorer,
                    () => _launchUrl(
                        'https://isaias-cordova-portfolio.netlify.app/'),
                    Colors.purple.shade900),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _contenedorViaContacto(icono, Function() funcion, color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: IconButton(
          color: Colors.white, onPressed: () => funcion(), icon: Icon(icono)),
    );
  }

  // Lanzar una url
  _launchUrl(String? direccion) async {
    final Uri url = Uri.parse(direccion!);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  _launchMailTo() async {
    final mailtolink = Mailto(
        to: ['isaiascordova323@gmail.com'],
        subject: 'Contacto - AppSorteo',
        body: 'Hola, quisiera contactar contigo!');

    await _launchUrl('$mailtolink');
  }
}
