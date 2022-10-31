import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:go_router/go_router.dart';

extension CustomBuildContext on BuildContext {
  bool isPortrait(Orientation orientation) {
    return orientation == Orientation.portrait;
  }

  bool isLandscape(Orientation orientation) {
    return orientation == Orientation.landscape;
  }

  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }

  ThemeData get theme {
    return Theme.of(this);
  }

  static List<Locale> get supportedLocales {
    return AppLocalizations.supportedLocales;
  }

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates {
    return AppLocalizations.localizationsDelegates;
  }

  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }
}

extension CustomString on String {
  String toUTF8() {
    return utf8.decode(codeUnits);
  }

  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
    return this;
  }

  String trimSpace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  String toFlag() {
    return String.fromCharCodes(
      List.of(toUpperCase().codeUnits.map((code) => code + 127397)),
    );
  }
}
