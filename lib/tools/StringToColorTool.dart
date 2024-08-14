
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';

class StringToColor{
  static Color getColor(String? name){
    if(name == null){
      return ColorUiHelper.popupColorList[3];
    }else{
      switch (name) {
         case "orange":
           return ColorUiHelper.popupColorList[0];
         case "green":
           return ColorUiHelper.popupColorList[1];
         case "purple":
           return ColorUiHelper.popupColorList[2];  
         case "blue":
           return ColorUiHelper.popupColorList[3];
         case "yellow":
           return ColorUiHelper.popupColorList[4];  
         default:
           return ColorUiHelper.popupColorList[3];
       }
    }
    
  }
  static String colorToString(int? index){
    if(index == null){
      return "blue";
    }else{
      switch (index) {
         case 0:
           return "orange";
         case 1:
           return "green";
         case 2:
           return "purple";  
         case 3:
           return "blue";
         case 4:
           return "yellow";  
         default:
           return "blue";
       }
    }
    
  }
}