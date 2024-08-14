
// ignore_for_file: camel_case_types, file_names

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';
import 'package:olcek_hesapla/widgets/lastCalcutesListWheel.dart';

class previousCalcutes extends StatelessWidget {
  const previousCalcutes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: BorderHelper.radius80,
                topRight: BorderHelper.radius80,
                bottomLeft: BorderHelper.radius80,
                bottomRight: BorderHelper.radius80),
            color: ColorUiHelper.ContentBackgroundColor),
        child: Stack(children: [
          LastCalcuteListView(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: ColorUiHelper.primaryContentColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: BorderHelper.radius24,
                      bottomRight: BorderHelper.radius24,
                    )),
                child: Text(
                  "GEÇMİŞ İŞLEMLERİNİZ",
                  style: TextStyleHelper.lastCalcutesTitleTextStyle,
                )),
          ),
        ]),
      ),
    );
  }
}
