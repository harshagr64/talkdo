import "package:google_fonts/google_fonts.dart";
import "package:flutter/material.dart";

TextStyle myStyle(double size, [Color color, FontWeight fw = FontWeight.w700, double ws = 0]) {
  return GoogleFonts.lato(
    fontSize: size,
    color: color,
    fontWeight: fw,
    wordSpacing: ws,
  );
}
