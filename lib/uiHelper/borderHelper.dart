// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';

class BorderHelper{
  static BorderRadius radiusCircular24=BorderRadius.circular(24);
  static BorderRadius radiusCircular16=BorderRadius.circular(16);
  static BorderRadius radiusCircular64=BorderRadius.circular(64);

  static Radius radius80=const Radius.circular(80);
  static Radius radius24=const Radius.circular(24);

  static BorderSide borderSideLight=BorderSide(color: ColorUiHelper.primaryContentColor,);
  static BorderSide borderSide=BorderSide(color: ColorUiHelper.primaryContentColor,width: 2,);
}