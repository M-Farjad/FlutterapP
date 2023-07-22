import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  Styles._();

  static TextStyle regularInter11(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0,
          bool lineThrough = false}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 11,
        letterSpacing: letterSpacing,
        decoration: lineThrough == true
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: lineThrough == true ? color : null,
        fontWeight: fontWeight,
      );
  static TextStyle regularMonteAlt28(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.montserratAlternates(
        color: color,
        fontSize: 28,
        fontWeight: fontWeight,
      );

  static TextStyle regularMonteAlt16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.montserratAlternates(
        color: color,
        fontSize: 16.3,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter18(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
        color: color,
        letterSpacing: letterSpacing,
        fontSize: 18,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter20(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 20,
        letterSpacing: 0.30,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter24(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 24,
        letterSpacing: 0.37,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter34(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 34,
        fontWeight: fontWeight,
        letterSpacing: 0.37,
      );

  static TextStyle regularInter14(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter15(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 15,
        fontWeight: fontWeight,
        letterSpacing: 0.30,
      );

  static TextStyle regularInter12(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 12,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter10(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularInter13(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 13,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
}
