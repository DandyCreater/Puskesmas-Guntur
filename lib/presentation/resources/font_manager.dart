import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FontWeightManager {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
}

class ThemeText {
  static TextStyle heading1 =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeightManager.bold);
  static TextStyle heading2 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeightManager.semiBold);
  static TextStyle heading3 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeightManager.medium);
  static TextStyle heading4 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeightManager.regular);
}
