
// ignore_for_file: file_names, camel_case_types

import 'package:button_animations/button_animations.dart';
import 'package:flutter/material.dart';
import 'package:olcek_hesapla/database/HiveStorage.dart';
import 'package:olcek_hesapla/locator/get_it.dart';
import 'package:olcek_hesapla/models/calcute.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';
import 'package:olcek_hesapla/widgets/calcuteHeader.dart';
import 'package:olcek_hesapla/widgets/lastCalcutes.dart';
import 'package:olcek_hesapla/widgets/measureInput.dart';
import 'package:olcek_hesapla/widgets/measureInputTwo.dart';
import 'package:olcek_hesapla/widgets/measureTypeListWheel.dart';

class homeContentWidget extends StatefulWidget {
  const homeContentWidget({super.key});

  @override
  State<homeContentWidget> createState() => _homeContentWidgetState();
}

class _homeContentWidgetState extends State<homeContentWidget> {
  int fromselect = 0;
  int toSelect = 0;
  List toSelectList = ["ÖLÇEK", "CM", "MM", "M", "KM"];
  List fromSelectList = ["CM", "ÖLÇEK", "MM", "M", "KM"];
  bool twoInput = true;
  bool threeInput = false;
  var inputKey = GlobalKey<FormFieldState>();
  var inputKey2 = GlobalKey<FormFieldState>();
  var inputKey3 = GlobalKey<FormFieldState>();
  // ignore: prefer_typing_uninitialized_variables
  late var measure;
  // ignore: prefer_typing_uninitialized_variables
  late var scalePre;
  // ignore: prefer_typing_uninitialized_variables
  late var scaleNew;
  calcute? calcutes;
  bool validateError = false;
  late HiveStorage database;

  @override
  void initState() {
    super.initState();
    database = locator<HiveStorage>();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      calcuteHeaderCard(
          // ignore: prefer_if_null_operators
          calcuteDetail: calcutes == null ? null : calcutes,
          validateError: validateError),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.35 - 25,
        left: MediaQuery.of(context).size.width / 2 - 60,
        child: AnimatedButton(
          width: 120,
          height: 50,
          // ignore: sort_child_properties_last
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.calculate,
                color: ColorUiHelper.ContentBackgroundColor,
              ),
              Text(
                "HESAPLA!",
                style: TextStyleHelper.CalcuteButtonTextStyle,
              ),
            ],
          ),
          onTap: () async {
            calcute? newCalcute;
            if (threeInput) {
              saveScaleToScale();
              if (!validateError) {
                newCalcute = calcute.create(
                    from: fromSelectList[fromselect],
                    to: toSelectList[toSelect],
                    measure: measure,
                    scale: scaleNew,
                    scalePre: scalePre);
              }
            } else if (twoInput) {
              saveMeasureToScale();
              if (!validateError) {
                newCalcute = calcute.create(
                    from: fromSelectList[fromselect],
                    to: toSelectList[toSelect],
                    measure: measure,
                    scale: scaleNew);
              }
            } else {
              saveMeasureToMeasure();
              if (!validateError) {
                newCalcute = calcute.create(
                    from: fromSelectList[fromselect],
                    to: toSelectList[toSelect],
                    measure: measure);
              }
            }
            if (!validateError) {
              calcutes = newCalcute;
              await database.addStorage(newCalcute!);
            }
          },
          borderRadius: 30,
          isMultiColor: true,
          isOutline: true,
          colors: [
            ColorUiHelper.primaryContentColor,
            ColorUiHelper.buttonGradientColor,
          ],
          shadowColor: ColorUiHelper.buttonGradientColor,
          shadowHeightBottom: 6,
        ),
      ),
      measurTypeeInput(
          alignment: Alignment.centerLeft,
          measure: (value) {
            setState(() {
              fromselect = value;
              if (fromSelectList[fromselect] == "ÖLÇEK" &&
                  toSelectList[toSelect] == "ÖLÇEK") {
                threeInput = true;
                twoInput = false;
              } else if (fromSelectList[fromselect] == "ÖLÇEK" ||
                  toSelectList[toSelect] == "ÖLÇEK") {
                twoInput = true;
                threeInput = false;
              } else {
                twoInput = false;
                threeInput = false;
              }
            });
          },
          inputList: fromSelectList,
          offAxisFraction: 3.5,
          select: fromselect),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 220,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              measureInput(
                inputKey: inputKey,
                inputSave: (value) {
                  setState(() {
                    measure = value;
                  });
                },
              ),
              threeInput == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: measureInputTwo(
                                inputKey: inputKey2,
                                inputSave: (value) {
                                  setState(() {
                                    scalePre = value;
                                  });
                                },
                                label: "Eski Ölçek"),
                          ),
                          measureInputTwo(
                            inputKey: inputKey3,
                            inputSave: (value) {
                              setState(() {
                                scaleNew = value;
                              });
                            },
                            label: "Yeni Ölçek",
                          ),
                        ])
                  : (twoInput == true
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: measureInputTwo(
                            inputKey: inputKey2,
                            inputSave: (value) {
                              setState(() {
                                scaleNew = value;
                              });
                            },
                            label: "Ölçeği Giriniz",
                            addwidth: 50,
                          ),
                        )
                      : Container())
            ],
          ),
        ),
      ),
      measurTypeeInput(
          alignment: Alignment.centerRight,
          measure: (value) {
            setState(() {
              toSelect = value;
              if (fromSelectList[fromselect] == "ÖLÇEK" &&
                  toSelectList[toSelect] == "ÖLÇEK") {
                threeInput = true;
                twoInput = false;
              } else if (fromSelectList[fromselect] == "ÖLÇEK" ||
                  toSelectList[toSelect] == "ÖLÇEK") {
                twoInput = true;
                threeInput = false;
              } else {
                twoInput = false;
                threeInput = false;
              }
            });
          },
          inputList: toSelectList,
          offAxisFraction: -3.5,
          select: toSelect),
      previousCalcutes(),
      Positioned(
        top: 20,
        child: PopupMenuButton(
        iconSize: 32,
        constraints: BoxConstraints(
          minWidth: 50,
          maxWidth: MediaQuery.of(context).size.width/6,
        ),
        shape: RoundedRectangleBorder(borderRadius:BorderHelper.radiusCircular24,side: BorderHelper.borderSide),
        onSelected: (value) {
          setState(() {
            database.updatePrimaryColorFromStorage(ColorUiHelper.popupColorList.indexOf(value));
            ColorUiHelper.primaryContentColor=value;
            BorderHelper.borderSideLight=BorderSide(color: ColorUiHelper.primaryContentColor,);
            BorderHelper.borderSide=BorderSide(color: ColorUiHelper.primaryContentColor,width: 2,);
            TextStyleHelper.floatingLabelStyle=TextStyle(fontWeight: FontWeight.bold, color: ColorUiHelper.primaryContentColor);
          });
        },
        itemBuilder: (context) {
          // ignore: sort_child_properties_last
          return ColorUiHelper.popupColorList.map((e) => PopupMenuItem(child: Icon(Icons.color_lens,color: e),value: e,)).toList();
      },)),
    ]);
  }

  void saveMeasureToMeasure() {
    inputKey.currentState!.save();
    if (measure == -1) {
      validateError = true;
    } else {
      inputKey.currentState!.reset();
      validateError = false;
    }
  }

  void saveMeasureToScale() {
    inputKey.currentState!.save();
    inputKey2.currentState!.save();
    if (measure == -1 || scaleNew == -1) {
      validateError = true;
    } else {
      if (toSelectList[toSelect] == "ÖLÇEK") {
        scaleNew = 1 / scaleNew;
      }

      inputKey.currentState!.reset();
      inputKey2.currentState!.reset();
      validateError = false;
    }
  }

  void saveScaleToScale() {
    inputKey.currentState!.save();
    inputKey2.currentState!.save();
    inputKey3.currentState!.save();

    if (measure == -1 || scaleNew == -1 || scalePre == -1) {
      validateError = true;
    } else {
      scaleNew = 1 / scaleNew;
      inputKey.currentState!.reset();
      inputKey2.currentState!.reset();
      inputKey3.currentState!.reset();
      validateError = false;
    }
  }
}
