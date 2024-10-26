
// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/models/calcute.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class calcuteHeaderCard extends StatelessWidget {
  final calcute? calcuteDetail;
  final bool validateError;
  const calcuteHeaderCard({
    required this.validateError,
    required this.calcuteDetail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight:BorderHelper.radius80,
                bottomLeft: BorderHelper.radius80),
            color: ColorUiHelper.primaryContentColor.withOpacity(0.8)),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width - 75,
                    decoration: BoxDecoration(
                        color: ColorUiHelper.answerContainerColor,
                        borderRadius:BorderHelper.radiusCircular24),
                    child: Center(
                        child: validateError == true
                            ? ShakeWidget(
                                onController: (controller) {
                                  Future.delayed(const Duration(milliseconds: 1000),
                                      () => controller.stop());
                                },
                                autoPlay: true,
                                duration: const Duration(milliseconds: 1000),
                                shakeConstant: ShakeChunkConstant(),
                                child: Text(
                                  "Önce Değerleri Giriniz!",
                                  style: TextStyleHelper.validateErrorAnswerTextStyle,
                                ))
                            : Text(
                                (calcuteDetail == null
                                    ? "Ölçek Ve Ölçüm Hesapla!"
                                    // ignore: prefer_interpolation_to_compose_strings
                                    : "= " + calcuteDetail!.answer.toString()),
                                style: TextStyleHelper.answerContainerWelcomeMessageTextStyle,
                              ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      calcuteDetail == null ? "" : calcuteDetail!.convertFrom,
                      style: TextStyleHelper.headerToFromValueTextStyle,
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: ColorUiHelper.headerFromBetweentoIconColor,
                      size: 48,
                    ),
                    Text(
                      calcuteDetail == null ? "" : calcuteDetail!.convertTo,
                      style: TextStyleHelper.headerToFromValueTextStyle,
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
