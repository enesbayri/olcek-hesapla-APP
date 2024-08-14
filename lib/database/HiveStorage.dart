// ignore_for_file: file_names

import 'dart:ui';

import 'package:olcek_hesapla/models/calcute.dart';
import 'package:olcek_hesapla/tools/StringToColorTool.dart';
import 'package:hive/hive.dart';

class HiveStorage{
  
  Box<calcute>? box;
  Box<String>? colorBox;
  HiveStorage(){
    box=Hive.box("calcutes");
    colorBox = Hive.box("primaryColor");
  }

  Future<void> addStorage(calcute clcte)async{
    if(box!.length==30){
      box!.deleteAt(0);
    }
    await box!.add(clcte);
  }
  List<calcute> getCalcutesfromStorage(){
    List<calcute> calcutes=[];
    if(box!.isNotEmpty){
      calcutes=box!.values.toList();
    }
    return calcutes;
  }

  Color getPrimaryColorFromStorage(){
    if(colorBox!.isNotEmpty){
      return StringToColor.getColor(colorBox!.values.first);
    }
    else { return StringToColor.getColor(null); }
  }

  Future<void> updatePrimaryColorFromStorage(int colorIndex)async{
    String primaryColor = StringToColor.colorToString(colorIndex);
    await colorBox!.put("color", primaryColor);
  }

  Future<void> deletefromStorage(int index)async{
    await box!.deleteAt(index);
  }


}