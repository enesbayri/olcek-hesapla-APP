// ignore_for_file: camel_case_types


import 'package:hive/hive.dart';
part 'calcute.g.dart';


@HiveType(typeId: 1)
class calcute {

  @HiveField(1)
  String convertFrom;
  @HiveField(2)
  String convertTo;
  @HiveField(3)
  double measure;
  @HiveField(4)
  double? scale;
  @HiveField(5)
  double? scalePre;
  @HiveField(6)
  DateTime created;
  @HiveField(7)
  late double answer;
  calcute({
    required this.convertFrom,
    required this.convertTo,
    required this.measure,
    this.scale,
    this.scalePre,
    required this.created,
  }){
    answer=_calcuteMeasure();
  }

  
  Map measureToCm={"MM":{"MM":1,"CM":0.1,"M":0.001,"KM":0.000001},"CM":{"MM":10,"CM":1,"M":0.01,"KM":0.00001},"M":{"MM":1000,"CM":100,"M":1,"KM":0.001},"KM":{"MM":1000000,"CM":100000,"M":1000,"KM":1}};

  factory calcute.create({required String from,required String to,required double measure, double? scale,double? scalePre}){
    DateTime created=DateTime.now();
    return calcute(convertFrom: from, convertTo: to, measure: measure, created: created,scale: scale,scalePre: scalePre);
  }

  double _calcuteMeasure(){
    double answer;
    if(measureToCm.keys.contains(convertFrom) && measureToCm.keys.contains(convertTo)){
      answer=measure*measureToCm[convertFrom][convertTo];
    }else if(scalePre!=null){
      answer=measure*scalePre!*scale!;
    }else{
      answer=measure*scale!;
    }
    return answer;
  }
  
}
