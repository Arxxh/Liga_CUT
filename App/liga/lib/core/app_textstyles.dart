import 'package:flutter/material.dart';
import 'package:liga/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// La mayor perdida de tiempo de mi dia libre ___*( ￣皿￣)/#____ //

class AppTextstyles {
  static TextStyle titleappbar = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.titleAppbar,
  );

  static TextStyle hamburgermenu = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.titleAppbar,
  );

  static TextStyle normaltext = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyText,
  );
}
