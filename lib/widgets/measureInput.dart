
// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';

class measureInput extends StatelessWidget {
  const measureInput({
    Key? key,
    required this.inputKey,
    required this.inputSave,
  }) : super(key: key);
  final GlobalKey inputKey;
  final Function inputSave;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderHelper.radiusCircular16,
            color: ColorUiHelper.ContentBackgroundColor),
        width: MediaQuery.of(context).size.width - 220,
        height: 50,
        child: TextFormField(
          key: inputKey,
          onSaved: (newValue) {
            if (newValue == "") {
              inputSave(-1);
            } else {
              inputSave(double.parse(newValue!));
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Lütfen ölçü giriniz!";
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
          ],
          minLines: 1,
          maxLines: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(right: 10, left: 10),
              hintText: "Ölçüyü Giriniz!",
              labelText: "Dönüştürülecek Ölçü",
              border: OutlineInputBorder(
                  borderRadius: BorderHelper.radiusCircular24,
                  borderSide: BorderHelper.borderSide),
              floatingLabelStyle:
                  TextStyleHelper.floatingLabelStyle,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderHelper.radiusCircular24,
                  borderSide: BorderHelper.borderSide),
              //disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24),borderSide: BorderSide(color: ColorUiHelper.primaryContentColor,width: 2)),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderHelper.borderSideLight,
                  borderRadius:BorderHelper.radiusCircular24)),
        ));
  }
}
