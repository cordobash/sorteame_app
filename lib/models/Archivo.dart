import 'dart:io';
import 'package:app_sorteos/models/boxes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class Archivo{
  String? pathArchivo;
  String? contenidoArchivo;
  String? nombreArchivo;
  List<String> ltsParticipantes = [];
  int? cantidadParticipantes;
  // Constructores
  Archivo({required List<String> participantes}){
    this.ltsParticipantes = participantes;
  }
  // void abrirArchivo(PlatformFile file) async{
  //   OpenFile.open(file.path);
  // }
  Future<void> seleccionarArchivo()async{
    List<String?> _listFinal = [];
    String _rachaCadena = "";
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      pathArchivo = result.files.single.path;
      nombreArchivo = result.names.toString();
      

      File archivo = File(pathArchivo!);
      
      String contenido = await archivo.readAsString();
      contenidoArchivo = contenido;
      for(int i = 0; i<contenido.length;i++){
        if(contenido[i].codeUnitAt(0) != 32){
          _rachaCadena+=contenido[i];
        }
      }
      ltsParticipantes.add(_rachaCadena);
      print('Lista actual de participantes ${ltsParticipantes}');

    }
  }
}