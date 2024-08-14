// ignore_for_file: camel_case_types, file_names, sort_child_properties_last, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';

// ignore: must_be_immutable
class measurTypeeInput extends StatefulWidget {
  Function measure;
  List inputList;
  Alignment alignment;
  double offAxisFraction;
  int select;
  measurTypeeInput({
    Key? key,
    required this.alignment,
    required this.measure,
    required this.inputList,
    required this.offAxisFraction,
    required this.select,
  }) : super(key: key);

  @override
  State<measurTypeeInput> createState() => _measureTypeInputState();
}

class _measureTypeInputState extends State<measurTypeeInput> {
  @override
  Widget build(BuildContext context) {
    int fromselect = widget.select;
    return Align(
      alignment: widget.alignment,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: widget.offAxisFraction > 0
                ? BorderRadius.only(
                    bottomRight: BorderHelper.radius80,
                    topRight: BorderHelper.radius80)
                : BorderRadius.only(
                    bottomLeft: BorderHelper.radius80,
                    topLeft: BorderHelper.radius80),
            color: ColorUiHelper.ContentBackgroundColor),
        width: 100,
        height: 150,
        child: ListWheelScrollView(
          children: [
            WheelListViewContainer(fromselect,0),
            WheelListViewContainer(fromselect,1),
            WheelListViewContainer(fromselect,2),
            WheelListViewContainer(fromselect,3),
            WheelListViewContainer(fromselect,4),
          ],
          itemExtent: 50,
          scrollBehavior: const ScrollBehavior(),
          onSelectedItemChanged: (value) {
            setState(() {
              widget.measure(value);
              fromselect = value;
            });
            
          },
          perspective: 0.005,
          diameterRatio: 1.5,
          offAxisFraction: widget.offAxisFraction,
          physics: const FixedExtentScrollPhysics(),
        ),
      ),
    );
  }

  Container WheelListViewContainer(int fromselect,int index) {
    return Container(
              child: Center(
                  child: Text(
                widget.inputList[index],
                style:TextStyleHelper.inputMeasureTypeTextStyle,
              )),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                      spreadRadius: 2,
                      color: ColorUiHelper.measureInputTypeShadowColor)
                ],
                borderRadius: BorderHelper.radiusCircular64,
                color: fromselect == index
                    ? ColorUiHelper.primaryContentColor
                    : ColorUiHelper.primaryContentColor.withOpacity(0.5),
              ));
  }
}
