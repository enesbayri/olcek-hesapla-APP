// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleHelper{

  // ignore: non_constant_identifier_names
  static TextStyle CalcuteButtonTextStyle=TextStyle(color: ColorUiHelper.ContentBackgroundColor, fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static TextStyle BoldTextStyle=const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle floatingLabelStyle=TextStyle(fontWeight: FontWeight.bold, color: ColorUiHelper.primaryContentColor);
  static TextStyle validateErrorAnswerTextStyle=const TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold);
  static TextStyle answerContainerWelcomeMessageTextStyle=const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20);
  static TextStyle headerToFromValueTextStyle=const TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold);     
  static TextStyle inputMeasureTypeTextStyle= const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold); 
  static TextStyle lastCalcutesTitleTextStyle=const TextStyle(fontWeight: FontWeight.bold,color: Colors.black);
  // ignore: non_constant_identifier_names
  static TextStyle DismisseCalcuteTextStyle=const TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static TextStyle LastCalcuteDateTextStyle=const TextStyle(fontSize: 10);    

  // ignore: non_constant_identifier_names
  static TextStyle TitleStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 20, color: ColorUiHelper.buttonGradientColor);  
}
