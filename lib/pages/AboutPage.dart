import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key});
  TextStyle _estiloCabecera = TextStyle(color:Colors.grey.shade700, fontSize: 18,fontWeight:FontWeight.w800 );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text('Desarrollado por:', style: _estiloCabecera,),
          Text('Isaias Cordova - (Desarrollador Movil)',style: _estiloCabecera,),
           Padding(
             padding:  EdgeInsets.only(top:20),
             child: Container(
               decoration:BoxDecoration(
                 color:Colors.pink,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Container(
                margin: EdgeInsets.all(10),
                 child: Text(
                  'Hagamos realidad tus ideas!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,color: Colors.white),
                           ),
               ),
             ),
           ),
          Text(
            'Vias de contacto',
            style: TextStyle(color: Colors.grey.shade800, fontSize: 17),
          ),
          // Redes sociales
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () => {
                  _launchUrl('https://github.com/IGerardoJR')
                }, child: Icon(SimpleIcons.github)),
                TextButton(
                    onPressed: () => {
                      _launchUrl('https://www.linkedin.com/in/isaias-gerardo-cordova-palomares-1586a2244/')
                    },
                    child: Icon(SimpleIcons.linkedin))
              ],
            ),
          )
        ],
      ),
    ));
  }

  _launchUrl(String? direccion) async {
    final Uri url = Uri.parse(direccion!);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
