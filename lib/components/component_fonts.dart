import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_test_adji/components/component_colors.dart';

class ComponentFonts {

  //Normal
  static final fontNormal12B = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ComponentColors.textColorBlack);

  //Medium
  static final fontMedium12B = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ComponentColors.textColorBlack);

  //Bold
  static final fontBold12B = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorBlack);
  static final fontBold14B = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorBlack);
  static final fontBold16B = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorBlack);
  static final fontBold18B = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorBlack);


  //Medium Grey1
  static final fontNormal12Grey1 = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ComponentColors.textColorGrey1);
  static final fontNormal14Grey1 = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ComponentColors.textColorGrey1);

  //Medium Grey2
  static final fontNormal14Grey2 = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ComponentColors.textColorGrey2);

  //Medium Green
  static final fontMedium12Green = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ComponentColors.textColorGreen);

  //Bold Green
  static final fontBold12Green = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorGreen);
  static final fontBold14Green = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorGreen);

  //Bold White
  static final fontBold14White = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorWhite);

  //Bold Red
  static final fontBold24Red = GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ComponentColors.textColorRed);

}