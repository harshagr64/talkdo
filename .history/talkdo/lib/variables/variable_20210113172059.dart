import "package:google_fonts/google_fonts.dart";
import "package:flutter/material.dart";

TextStyle myStyle(double size, [Color color, double space, double ws = 0]) {
  return GoogleFonts.lato(
    fontSize: size,
    color: color,
    letterSpacing: space,
    fontWeight: fw,
    wordSpacing: ws,
  );
}
