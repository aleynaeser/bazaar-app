import 'package:flutter/material.dart';

class ThemeColors {
  final Color themeColor1;
  final Color themeColor2;
  final Color themeColor3;
  final Color themeColor4;
  final Color themeColor5;
  final Color themeColor6;
  final Color themeColor7;
  final Color themeColor8;
  final Color themeColor9;
  final Color themeColor10;
  final Color themeColor11;

  const ThemeColors._({
    required this.themeColor1,
    required this.themeColor2,
    required this.themeColor3,
    required this.themeColor4,
    required this.themeColor5,
    required this.themeColor6,
    required this.themeColor7,
    required this.themeColor8,
    required this.themeColor9,
    required this.themeColor10,
    required this.themeColor11,
  });

  static const light = ThemeColors._(
    themeColor1: Color(0xFFf7f7f9),
    themeColor2: Color(0xFFEAEAEA),
    themeColor3: Color(0xFFFF8E39),
    themeColor4: Color(0xFF282829),
    themeColor5: Color(0xFF181818),
    themeColor6: Color(0xFF636466),
    themeColor7: Color(0xFFC4C4C4),
    themeColor8: Color(0xFFdee0e1),
    themeColor9: Color.fromARGB(33, 0, 0, 0),
    themeColor10: Color(0xFFFF7002),
    themeColor11: Color(0xFF38C071),
  );

  static const dark = ThemeColors._(
    themeColor1: Color(0xFF181818),
    themeColor2: Color(0xFF1F1F1F),
    themeColor3: Color(0xFFFF8E39),
    themeColor4: Color(0xFFF2F1F1),
    themeColor5: Color(0xFFf7f7f9),
    themeColor6: Color(0xFFBCBCBC),
    themeColor7: Color(0xFF414141),
    themeColor8: Color(0xFF393839),
    themeColor9: Color.fromARGB(3, 255, 255, 255),
    themeColor10: Color(0xFFFF7002),
    themeColor11: Color(0xFF38C071),
  );
}
