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
