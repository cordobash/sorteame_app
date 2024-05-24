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

  static String m1(name) => "Winner: ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "PAGINA_ACERCADE": MessageLookupByLibrary.simpleMessage(""),
        "PAGINA_AJUSTES": MessageLookupByLibrary.simpleMessage(""),
        "PAGINA_RESULTADOSANTERIORES": MessageLookupByLibrary.simpleMessage(""),
        "TRADUCCION_MESES": MessageLookupByLibrary.simpleMessage(""),
        "activateAnimations":
            MessageLookupByLibrary.simpleMessage("Enable draw animations"),
        "amount":
            MessageLookupByLibrary.simpleMessage("Number of participants: "),
        "april": MessageLookupByLibrary.simpleMessage("April"),
        "august": MessageLookupByLibrary.simpleMessage("August"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "career": MessageLookupByLibrary.simpleMessage("(Software Engineer)"),
        "choicecolor": MessageLookupByLibrary.simpleMessage(
            "Choice one of the following colors:"),
        "contact": MessageLookupByLibrary.simpleMessage("My social networks"),
        "countdown": MessageLookupByLibrary.simpleMessage("Countdown"),
        "datetimedraw": m0,
        "december": MessageLookupByLibrary.simpleMessage("December"),
        "deleteAfter": MessageLookupByLibrary.simpleMessage(
            "Delete all participants after draw"),
        "developedby": MessageLookupByLibrary.simpleMessage("Developed by"),
        "duplicatedNames":
            MessageLookupByLibrary.simpleMessage("Allow duplicated names"),
        "editparticipant":
            MessageLookupByLibrary.simpleMessage("Edit participant"),
        "febraury": MessageLookupByLibrary.simpleMessage("Febraury"),
        "firstdraw":
            MessageLookupByLibrary.simpleMessage("Make your first draw!"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "history_warningmessage": MessageLookupByLibrary.simpleMessage(
            "This action will delete all draw records. Do you want to continue?"),
        "historydelall": MessageLookupByLibrary.simpleMessage("Delete all"),
        "january": MessageLookupByLibrary.simpleMessage("January"),
        "july": MessageLookupByLibrary.simpleMessage("July"),
        "june": MessageLookupByLibrary.simpleMessage("June"),
        "language": MessageLookupByLibrary.simpleMessage("Select language"),
        "letsmakereal": MessageLookupByLibrary.simpleMessage(
            "Let\'s make real your ideas!"),
        "march": MessageLookupByLibrary.simpleMessage("March"),
        "maxCells": MessageLookupByLibrary.simpleMessage(
            "Maximum cells in a row on mosaic mode "),
        "may": MessageLookupByLibrary.simpleMessage("May"),
        "modalchoicecolor":
            MessageLookupByLibrary.simpleMessage("Choice a color"),
        "november": MessageLookupByLibrary.simpleMessage("November"),
        "october": MessageLookupByLibrary.simpleMessage("October"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "pastwinner": m1,
        "personalization":
            MessageLookupByLibrary.simpleMessage("Personalization"),
        "september": MessageLookupByLibrary.simpleMessage("September"),
        "showDeleteDialog":
            MessageLookupByLibrary.simpleMessage("Show deletion dialog"),
        "themeApp": MessageLookupByLibrary.simpleMessage("Theme color"),
        "thememode": MessageLookupByLibrary.simpleMessage("Enable dark mode"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning")
      };
}
