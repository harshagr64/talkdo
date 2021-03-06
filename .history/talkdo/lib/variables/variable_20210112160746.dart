import "package:google_fonts/google_fonts.dart";
import "package:flutter/material.dart";

TextStyle myStyle(double size, [Color color, FontWeight fw = FontWeight.w700, double ws =]) {
  return GoogleFonts.lato(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
