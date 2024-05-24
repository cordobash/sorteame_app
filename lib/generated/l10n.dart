// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the 'LABELS GENERALES' key

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get PAGINA_AJUSTES {
    return Intl.message(
      '',
      name: 'PAGINA_AJUSTES',
      desc: '',
      args: [],
    );
  }

  /// `Countdown`
  String get countdown {
    return Intl.message(
      'Countdown',
      name: 'countdown',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Delete all participants after draw`
  String get deleteAfter {
    return Intl.message(
      'Delete all participants after draw',
      name: 'deleteAfter',
      desc: '',
      args: [],
    );
  }

  /// `Enable draw animations`
  String get activateAnimations {
    return Intl.message(
      'Enable draw animations',
      name: 'activateAnimations',
      desc: '',
      args: [],
    );
  }

  /// `Allow duplicated names`
  String get duplicatedNames {
    return Intl.message(
      'Allow duplicated names',
      name: 'duplicatedNames',
      desc: '',
      args: [],
    );
  }

  /// `Edit participant`
  String get editparticipant {
    return Intl.message(
      'Edit participant',
      name: 'editparticipant',
      desc: '',
      args: [],
    );
  }

  /// `Show deletion dialog`
  String get showDeleteDialog {
    return Intl.message(
      'Show deletion dialog',
      name: 'showDeleteDialog',
      desc: '',
      args: [],
    );
  }

  /// `Maximum cells in a row on mosaic mode `
  String get maxCells {
    return Intl.message(
      'Maximum cells in a row on mosaic mode ',
      name: 'maxCells',
      desc: '',
      args: [],
    );
  }

  /// `Personalization`
  String get personalization {
    return Intl.message(
      'Personalization',
      name: 'personalization',
      desc: '',
      args: [],
    );
  }

  /// `Theme color`
  String get themeApp {
    return Intl.message(
      'Theme color',
      name: 'themeApp',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get language {
    return Intl.message(
      'Select language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Enable dark mode`
  String get thememode {
    return Intl.message(
      'Enable dark mode',
      name: 'thememode',
      desc: '',
      args: [],
    );
  }

  /// `Choice a color`
  String get modalchoicecolor {
    return Intl.message(
      'Choice a color',
      name: 'modalchoicecolor',
      desc: '',
      args: [],
    );
  }

  /// `Choice one of the following colors:`
  String get choicecolor {
    return Intl.message(
      'Choice one of the following colors:',
      name: 'choicecolor',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get PAGINA_ACERCADE {
    return Intl.message(
      '',
      name: 'PAGINA_ACERCADE',
      desc: '',
      args: [],
    );
  }

  /// `Developed by`
  String get developedby {
    return Intl.message(
      'Developed by',
      name: 'developedby',
      desc: '',
      args: [],
    );
  }

  /// `(Software Engineer)`
  String get career {
    return Intl.message(
      '(Software Engineer)',
      name: 'career',
      desc: '',
      args: [],
    );
  }

  /// `Let's make real your ideas!`
  String get letsmakereal {
    return Intl.message(
      'Let\'s make real your ideas!',
      name: 'letsmakereal',
      desc: '',
      args: [],
    );
  }

  /// `My social networks`
  String get contact {
    return Intl.message(
      'My social networks',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get PAGINA_RESULTADOSANTERIORES {
    return Intl.message(
      '',
      name: 'PAGINA_RESULTADOSANTERIORES',
      desc: '',
      args: [],
    );
  }

  /// `Winner: {name}`
  String pastwinner(Object name) {
    return Intl.message(
      'Winner: $name',
      name: 'pastwinner',
      desc: '',
      args: [name],
    );
  }

  /// `Number of participants: `
  String get amount {
    return Intl.message(
      'Number of participants: ',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Make your first draw!`
  String get firstdraw {
    return Intl.message(
      'Make your first draw!',
      name: 'firstdraw',
      desc: '',
      args: [],
    );
  }

  /// `Date: {month} {day}, {year} at {hora}:{minuto} hours`
  String datetimedraw(
      Object month, Object day, Object year, Object hora, Object minuto) {
    return Intl.message(
      'Date: $month $day, $year at $hora:$minuto hours',
      name: 'datetimedraw',
      desc: '',
      args: [month, day, year, hora, minuto],
    );
  }

  /// `Delete all`
  String get historydelall {
    return Intl.message(
      'Delete all',
      name: 'historydelall',
      desc: '',
      args: [],
    );
  }

  /// `This action will delete all draw records. Do you want to continue?`
  String get history_warningmessage {
    return Intl.message(
      'This action will delete all draw records. Do you want to continue?',
      name: 'history_warningmessage',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get TRADUCCION_MESES {
    return Intl.message(
      '',
      name: 'TRADUCCION_MESES',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get january {
    return Intl.message(
      'January',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `Febraury`
  String get febraury {
    return Intl.message(
      'Febraury',
      name: 'febraury',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get march {
    return Intl.message(
      'March',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get april {
    return Intl.message(
      'April',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get july {
    return Intl.message(
      'July',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get august {
    return Intl.message(
      'August',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get september {
    return Intl.message(
      'September',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get november {
    return Intl.message(
      'November',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get december {
    return Intl.message(
      'December',
      name: 'december',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
