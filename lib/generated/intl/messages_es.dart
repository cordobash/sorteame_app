// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(month, day, year, hora, minuto) =>
      "Fecha del sorteo: ${day} de ${month} del ${year} a las ${hora}:${minuto} hrs";

  static String m1(name) => "El ganador del sorteo ${name} es...";

  static String m2(name) => "Ganador: ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ALERT_NOANIMATED": MessageLookupByLibrary.simpleMessage(""),
        "BARRA_NAVEGACION_TITULOS": MessageLookupByLibrary.simpleMessage(""),
        "DRAWER_MENU": MessageLookupByLibrary.simpleMessage(""),
        "EDITAR_PARTICIPANTE": MessageLookupByLibrary.simpleMessage(""),
        "EXIT_DIALOG": MessageLookupByLibrary.simpleMessage(""),
        "PAGINA_ACERCADE": MessageLookupByLibrary.simpleMessage(""),
        "PAGINA_AJUSTES": MessageLookupByLibrary.simpleMessage(""),
        "PAGINA_RESULTADOSANTERIORES": MessageLookupByLibrary.simpleMessage(""),
        "PRINCIPAL": MessageLookupByLibrary.simpleMessage(""),
        "PRINCIPAL_ALERT_NODISPONIBLE":
            MessageLookupByLibrary.simpleMessage(""),
        "PRINCIPAL_MODALVIEW": MessageLookupByLibrary.simpleMessage(""),
        "PRINCIPAL_MODALVIEW_ARCHIVO": MessageLookupByLibrary.simpleMessage(""),
        "PRINCIPAL_MODALVIEW_MANUAL": MessageLookupByLibrary.simpleMessage(""),
        "TRADUCCION_MESES": MessageLookupByLibrary.simpleMessage(""),
        "activateAnimations":
            MessageLookupByLibrary.simpleMessage("Activar animacion"),
        "add": MessageLookupByLibrary.simpleMessage("Agregar"),
        "amount":
            MessageLookupByLibrary.simpleMessage("Numero de participantes: "),
        "april": MessageLookupByLibrary.simpleMessage("Abril"),
        "august": MessageLookupByLibrary.simpleMessage("Agosto"),
        "backtohome": MessageLookupByLibrary.simpleMessage("Regresar a inicio"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "career":
            MessageLookupByLibrary.simpleMessage("(Desarrollador de software)"),
        "choicecolor": MessageLookupByLibrary.simpleMessage(
            "Selecciona uno de los siguientes colores"),
        "contact": MessageLookupByLibrary.simpleMessage("Vias de contacto"),
        "countdown": MessageLookupByLibrary.simpleMessage("Cuenta regresiva"),
        "datetimedraw": m0,
        "december": MessageLookupByLibrary.simpleMessage("Diciembre"),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "deleteAfter": MessageLookupByLibrary.simpleMessage(
            "Eliminar participantes post sorteo"),
        "developedby": MessageLookupByLibrary.simpleMessage("Desarrollado por"),
        "draw_congratulations":
            MessageLookupByLibrary.simpleMessage("Felicidades al ganador!"),
        "draw_congratulations_forbeing": MessageLookupByLibrary.simpleMessage(
            "Por haber sido ganador del sorteo"),
        "draw_result_title":
            MessageLookupByLibrary.simpleMessage("Resultados del sorteo"),
        "drawer_title":
            MessageLookupByLibrary.simpleMessage("Menu de opciones"),
        "duplicatedNames":
            MessageLookupByLibrary.simpleMessage("Permitir nombres duplicados"),
        "edit_alert_delete_additional_label":
            MessageLookupByLibrary.simpleMessage(
                "El participante que seleccionaste para eliminar es:"),
        "edit_alert_delete_checktext": MessageLookupByLibrary.simpleMessage(
            "No volver a mostrar este dialogo"),
        "edit_alert_delete_content": MessageLookupByLibrary.simpleMessage(
            "Este es un dialogo de confirmacion para la eliminacion del participante seleccionado. Puedes desactivar este dialogo en ajustes o marcando la casilla."),
        "edit_alert_delete_continue":
            MessageLookupByLibrary.simpleMessage("¿Deseas continuar?"),
        "edit_alert_delete_title":
            MessageLookupByLibrary.simpleMessage("Eliminar participante"),
        "edit_alert_update_content": MessageLookupByLibrary.simpleMessage(
            "En este apartado podras modificar el nombre del participante que hayas seleccionado en la lista."),
        "edit_alert_update_currentnamelabel":
            MessageLookupByLibrary.simpleMessage("Nombre actual:"),
        "edit_alert_update_newnamelabel":
            MessageLookupByLibrary.simpleMessage("Nuevo nombre:"),
        "edit_alert_update_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Nuevo nombre"),
        "edit_alert_update_title":
            MessageLookupByLibrary.simpleMessage("Editar participante"),
        "edit_bartitle":
            MessageLookupByLibrary.simpleMessage("Editar participante"),
        "edit_empty": MessageLookupByLibrary.simpleMessage(
            "Aun no haz agregado participantes"),
        "edit_filter":
            MessageLookupByLibrary.simpleMessage("Buscar por nombre"),
        "edit_segmented_label":
            MessageLookupByLibrary.simpleMessage("Accion a realizar"),
        "edit_table_delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "edit_table_modify": MessageLookupByLibrary.simpleMessage("Modificar"),
        "edit_table_name":
            MessageLookupByLibrary.simpleMessage("Nombre participante"),
        "editparticipant":
            MessageLookupByLibrary.simpleMessage("Editar participante"),
        "exit": MessageLookupByLibrary.simpleMessage("Salir"),
        "exit_content": MessageLookupByLibrary.simpleMessage(
            "¿Estas seguro de salir de la aplicacion?"),
        "exit_title":
            MessageLookupByLibrary.simpleMessage("Salir de la aplicacion"),
        "february": MessageLookupByLibrary.simpleMessage("Febrero"),
        "firstdraw":
            MessageLookupByLibrary.simpleMessage("Realiza tu primer sorteo!"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "history_warningmessage": MessageLookupByLibrary.simpleMessage(
            "Esta accion eliminara todos los registros.¿Desea continuar?"),
        "historydelall": MessageLookupByLibrary.simpleMessage("Eliminar todo"),
        "january": MessageLookupByLibrary.simpleMessage("Enero"),
        "july": MessageLookupByLibrary.simpleMessage("Julio"),
        "june": MessageLookupByLibrary.simpleMessage("Junio"),
        "language": MessageLookupByLibrary.simpleMessage("Seleccionar idioma"),
        "letsmakereal":
            MessageLookupByLibrary.simpleMessage("Hagamos realidad tus ideas!"),
        "main_btnadd":
            MessageLookupByLibrary.simpleMessage("Agregar participante"),
        "main_btndraw": MessageLookupByLibrary.simpleMessage("Realizar sorteo"),
        "main_emptycontainer": MessageLookupByLibrary.simpleMessage(
            "Añade al menos 1 participante"),
        "main_errortext_textfield": MessageLookupByLibrary.simpleMessage(
            "El titulo esta vacio o no es valido"),
        "main_hintitle":
            MessageLookupByLibrary.simpleMessage("Titulo del sorteo"),
        "main_ltspart":
            MessageLookupByLibrary.simpleMessage("Lista de participantes"),
        "main_modal_archivo_btntext":
            MessageLookupByLibrary.simpleMessage("Selecciona un archivo"),
        "main_modal_archivo_defaultempty":
            MessageLookupByLibrary.simpleMessage("Ningun archivo seleccionado"),
        "main_modal_archivo_subtextone": MessageLookupByLibrary.simpleMessage(
            "Añade a los participantes de tu sorteo desde un archivo"),
        "main_modal_archivo_subtextwo": MessageLookupByLibrary.simpleMessage(
            "El tipo de archivo admitido para esta operacion es solamente en formato .txt"),
        "main_modal_archivo_title":
            MessageLookupByLibrary.simpleMessage("Agregar via archivo"),
        "main_modal_btnmanual":
            MessageLookupByLibrary.simpleMessage("Manualmente"),
        "main_modal_btnsubir":
            MessageLookupByLibrary.simpleMessage("Subir un archivo"),
        "main_modal_manual_action":
            MessageLookupByLibrary.simpleMessage("Agregar"),
        "main_modal_manual_content": MessageLookupByLibrary.simpleMessage(
            "En el siguiente campo anote el nombre del participante:"),
        "main_modal_manual_hintext":
            MessageLookupByLibrary.simpleMessage("Nombre del participante"),
        "main_modal_manual_title":
            MessageLookupByLibrary.simpleMessage("Añadir participante"),
        "main_modal_subtext_one": MessageLookupByLibrary.simpleMessage(
            "¿Como deseas añadir a tus participantes?"),
        "main_modal_subtext_two": MessageLookupByLibrary.simpleMessage(
            "Puedes hacerlo de dos formas: Los puedes ir agregando de forma manual uno por uno o anotarlos en un archivo con formato txt y subirlo a la aplicacion"),
        "main_modal_titlelabel":
            MessageLookupByLibrary.simpleMessage("Añadir participante"),
        "march": MessageLookupByLibrary.simpleMessage("Marzo"),
        "maxCells": MessageLookupByLibrary.simpleMessage(
            "Maximo de celdas por fila en modo mosaico"),
        "may": MessageLookupByLibrary.simpleMessage("Mayo"),
        "modalchoicecolor":
            MessageLookupByLibrary.simpleMessage("Seleccionar un color"),
        "na_information": MessageLookupByLibrary.simpleMessage("Informacion"),
        "na_text": MessageLookupByLibrary.simpleMessage(
            "Caracteristica no disponible en version web."),
        "nav_about": MessageLookupByLibrary.simpleMessage("Acerca de mi"),
        "nav_history":
            MessageLookupByLibrary.simpleMessage("Resultados anteriores"),
        "nav_main": MessageLookupByLibrary.simpleMessage("Principal"),
        "nav_settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "noanimated_content": m1,
        "november": MessageLookupByLibrary.simpleMessage("Noviembre"),
        "october": MessageLookupByLibrary.simpleMessage("Octubre"),
        "ok": MessageLookupByLibrary.simpleMessage("Aceptar"),
        "pastwinner": m2,
        "personalization":
            MessageLookupByLibrary.simpleMessage("Personalizacion"),
        "september": MessageLookupByLibrary.simpleMessage("Septiembre"),
        "showDeleteDialog": MessageLookupByLibrary.simpleMessage(
            "Mostrar dialogo al eliminar participante"),
        "themeApp": MessageLookupByLibrary.simpleMessage("Color principal"),
        "thememode":
            MessageLookupByLibrary.simpleMessage("Activar modo oscuro"),
        "timeleft": MessageLookupByLibrary.simpleMessage(
            "Tiempo restante para conocer al ganador!"),
        "update": MessageLookupByLibrary.simpleMessage("Actualizar"),
        "warning": MessageLookupByLibrary.simpleMessage("Advertencia")
      };
}
