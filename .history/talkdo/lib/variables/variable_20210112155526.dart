import "package:google_fonts/google_fonts.dart";
import "package:flutter/material.dart";

TextStyle myStyle(double size, [Color color, FontWeight fw = FontWeight.w700]) {
  return GoogleFonts.lato(
    fontSize: size
  );
}
