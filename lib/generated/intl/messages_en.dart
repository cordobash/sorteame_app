// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(month, day, year, hora, minuto) =>
      "Date: ${month} ${day}, ${year} at ${hora}:${minuto} hours";

  static String m1(name) => "The winner of the draw ${name} are...";

  static String m2(name) => "Winner: ${name}";

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
            MessageLookupByLibrary.simpleMessage("Enable draw animations"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "amount":
            MessageLookupByLibrary.simpleMessage("Number of participants: "),
        "april": MessageLookupByLibrary.simpleMessage("April"),
        "august": MessageLookupByLibrary.simpleMessage("August"),
        "backtohome": MessageLookupByLibrary.simpleMessage("Back to home"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "career": MessageLookupByLibrary.simpleMessage("(Software Engineer)"),
        "choicecolor": MessageLookupByLibrary.simpleMessage(
            "Choose one of the following colors:"),
        "contact": MessageLookupByLibrary.simpleMessage("My social networks"),
        "countdown": MessageLookupByLibrary.simpleMessage("Countdown"),
        "datetimedraw": m0,
        "december": MessageLookupByLibrary.simpleMessage("December"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAfter": MessageLookupByLibrary.simpleMessage(
            "Delete all participants after draw"),
        "developedby": MessageLookupByLibrary.simpleMessage("Developed by"),
        "draw_congratulations": MessageLookupByLibrary.simpleMessage(
            "Congratulations to the winner!"),
        "draw_congratulations_forbeing": MessageLookupByLibrary.simpleMessage(
            "For being the winner of the draw"),
        "draw_result_title":
            MessageLookupByLibrary.simpleMessage("Draw results"),
        "drawer_title": MessageLookupByLibrary.simpleMessage("Menu"),
        "duplicatedNames":
            MessageLookupByLibrary.simpleMessage("Allow duplicated names"),
        "edit_alert_delete_additional_label":
            MessageLookupByLibrary.simpleMessage(
                "The chosen participant to be deleted from the list is:"),
        "edit_alert_delete_checktext": MessageLookupByLibrary.simpleMessage(
            "Do not show this dialog again"),
        "edit_alert_delete_content": MessageLookupByLibrary.simpleMessage(
            "If you have mistakenly added a participant, you can delete it in this section. This confirmation dialog can be disabled in the settings"),
        "edit_alert_delete_continue":
            MessageLookupByLibrary.simpleMessage("Do you want to continue?"),
        "edit_alert_delete_title":
            MessageLookupByLibrary.simpleMessage("Delete participant"),
        "edit_alert_update_content": MessageLookupByLibrary.simpleMessage(
            "In this section you can edit the participant you\'ve chosen"),
        "edit_alert_update_currentnamelabel":
            MessageLookupByLibrary.simpleMessage("Current name:"),
        "edit_alert_update_newnamelabel":
            MessageLookupByLibrary.simpleMessage("New name:"),
        "edit_alert_update_textfield_hint":
            MessageLookupByLibrary.simpleMessage("New name"),
        "edit_alert_update_title": MessageLookupByLibrary.simpleMessage("Edit"),
        "edit_bartitle":
            MessageLookupByLibrary.simpleMessage("Edit participant"),
        "edit_empty": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any participant yet"),
        "edit_filter": MessageLookupByLibrary.simpleMessage("Search by name"),
        "edit_segmented_label":
            MessageLookupByLibrary.simpleMessage("Action to be taken"),
        "edit_table_delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "edit_table_modify": MessageLookupByLibrary.simpleMessage("Modify"),
        "edit_table_name": MessageLookupByLibrary.simpleMessage("   Name"),
        "editparticipant":
            MessageLookupByLibrary.simpleMessage("Edit participant"),
        "exit": MessageLookupByLibrary.simpleMessage("Close"),
        "exit_content": MessageLookupByLibrary.simpleMessage(
            "Do you want to close this app?"),
        "exit_title": MessageLookupByLibrary.simpleMessage("Close App"),
        "february": MessageLookupByLibrary.simpleMessage("February"),
        "firstdraw":
            MessageLookupByLibrary.simpleMessage("Make your first draw!"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "history_warningmessage": MessageLookupByLibrary.simpleMessage(
            "This action will delete all draw records. Do you want to continue?"),
        "historydelall": MessageLookupByLibrary.simpleMessage("Delete all"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "january": MessageLookupByLibrary.simpleMessage("January"),
        "july": MessageLookupByLibrary.simpleMessage("July"),
        "june": MessageLookupByLibrary.simpleMessage("June"),
        "language": MessageLookupByLibrary.simpleMessage("Select language"),
        "letsmakereal": MessageLookupByLibrary.simpleMessage(
            "Let\'s make your ideas real!"),
        "main_btnadd": MessageLookupByLibrary.simpleMessage("Add people"),
        "main_btndraw": MessageLookupByLibrary.simpleMessage("Make the draw!"),
        "main_emptycontainer":
            MessageLookupByLibrary.simpleMessage("Add at least 1 participant"),
        "main_errortext_textfield": MessageLookupByLibrary.simpleMessage(
            "The title is empty or not valid"),
        "main_hintitle": MessageLookupByLibrary.simpleMessage("Draw title"),
        "main_ltspart":
            MessageLookupByLibrary.simpleMessage("List of participants"),
        "main_modal_archivo_btntext":
            MessageLookupByLibrary.simpleMessage("Select a file"),
        "main_modal_archivo_defaultempty":
            MessageLookupByLibrary.simpleMessage("No file selected"),
        "main_modal_archivo_subtextone": MessageLookupByLibrary.simpleMessage(
            "You can import the participant list from a file"),
        "main_modal_archivo_subtextwo": MessageLookupByLibrary.simpleMessage(
            "The allowed file extension is .txt"),
        "main_modal_archivo_title":
            MessageLookupByLibrary.simpleMessage("Upload a file"),
        "main_modal_btnmanual":
            MessageLookupByLibrary.simpleMessage("Manually"),
        "main_modal_btnsubir":
            MessageLookupByLibrary.simpleMessage("Upload file"),
        "main_modal_manual_action": MessageLookupByLibrary.simpleMessage("Add"),
        "main_modal_manual_content": MessageLookupByLibrary.simpleMessage(
            "In the next field write the name of the new participant:"),
        "main_modal_manual_hintext":
            MessageLookupByLibrary.simpleMessage("New participant name"),
        "main_modal_manual_title":
            MessageLookupByLibrary.simpleMessage("Add new participant"),
        "main_modal_subtext_one": MessageLookupByLibrary.simpleMessage(
            "How would you like to add the participants?"),
        "main_modal_subtext_two": MessageLookupByLibrary.simpleMessage(
            "You can add the participants manually or upload a text file"),
        "main_modal_titlelabel":
            MessageLookupByLibrary.simpleMessage("Add new participant"),
        "march": MessageLookupByLibrary.simpleMessage("March"),
        "maxCells": MessageLookupByLibrary.simpleMessage(
            "Maximum cells per row in mosaic mode"),
        "may": MessageLookupByLibrary.simpleMessage("May"),
        "modalchoicecolor":
            MessageLookupByLibrary.simpleMessage("Choose a color"),
        "na_information": MessageLookupByLibrary.simpleMessage("Information"),
        "na_text": MessageLookupByLibrary.simpleMessage(
            "This feature is not available in the web version."),
        "nav_about": MessageLookupByLibrary.simpleMessage("About"),
        "nav_history": MessageLookupByLibrary.simpleMessage("History"),
        "nav_main": MessageLookupByLibrary.simpleMessage("Main"),
        "nav_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "noanimated_content": m1,
        "november": MessageLookupByLibrary.simpleMessage("November"),
        "october": MessageLookupByLibrary.simpleMessage("October"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "pastwinner": m2,
        "personalization":
            MessageLookupByLibrary.simpleMessage("Personalization"),
        "september": MessageLookupByLibrary.simpleMessage("September"),
        "showDeleteDialog":
            MessageLookupByLibrary.simpleMessage("Show deletion dialog"),
        "themeApp": MessageLookupByLibrary.simpleMessage("Theme color"),
        "thememode": MessageLookupByLibrary.simpleMessage("Enable dark mode"),
        "timeleft": MessageLookupByLibrary.simpleMessage(
            "Time left to know the winner!"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning")
      };
}
