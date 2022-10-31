import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'option.dart';

class Themes {
  const Themes._();

  static const primaryColor = CupertinoColors.white; // 0xFF13B9FF
  static const secondaryColor = Color(0xFFE10101);

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: FontFamily.notoSansDisplay,
        scaffoldBackgroundColor: CupertinoColors.black,
        primaryColorDark: CupertinoColors.darkBackgroundGray,
        primaryColorLight: CupertinoColors.darkBackgroundGray,
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          barBackgroundColor: CupertinoColors.black,
          textTheme: CupertinoTextThemeData(),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CupertinoColors.black,
          centerTitle: true,
          elevation: 0.0,
        ),
        colorScheme: const ColorScheme.dark(
          onSecondary: Color(0xFFBFC7D5),
          onPrimary: CupertinoColors.black,
          secondary: secondaryColor,
          primary: primaryColor,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 0.8,
          space: 0.8,
        ),
      );
}
