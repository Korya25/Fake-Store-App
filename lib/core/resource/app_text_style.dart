import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headline = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.ordinaryText,
  );

  static TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.ordinaryText,
  );

  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.ordinaryText,
  );

  static TextStyle subheads = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.ordinaryText,
  );

  static TextStyle text = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.ordinaryText,
  );

  static TextStyle descriptiveItems = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.ordinaryText,
  );

  static TextStyle descriptionText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.ordinaryText,
  );

  static TextStyle helperText = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color:AppColors.ordinaryText,
  );
}
