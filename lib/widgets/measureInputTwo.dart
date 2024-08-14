// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';

class measureInputTwo extends StatelessWidget {
  measureInputTwo({
    int addwidth = 0,
    required this.label,
    required this.inputKey,
    required this.inputSave,
    super.key,
  }) {
    newWidht = addwidth;
  }
  late final GlobalKey inputKey;
  late final Function inputSave;

  final String label;
  late final int newWidht;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderHelper.radiusCircular16,
            color: ColorUiHelper.ContentBackgroundColor),
        width: (MediaQuery.of(context).size.width - 250) + newWidht,
        height: 30,
        child: TextFormField(
          key: inputKey,
          keyboardType: TextInputType.number,
          onSaved: (newValue) {
            if (newValue == "") {
              inputSave(-1);
            } else {
              inputSave(double.parse(newValue!));
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Lütfen ölçek giriniz!";
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
          ],
          decoration: InputDecoration(
              prefix: Text(
                "1/",
                style: TextStyleHelper.BoldTextStyle,
              ),
              contentPadding: const EdgeInsets.only(right: 10, left: 10),
              labelText: label,
              border: OutlineInputBorder(
                  borderRadius: BorderHelper.radiusCircular24,
                  borderSide: BorderHelper.borderSide),
              floatingLabelStyle:
                  TextStyleHelper.floatingLabelStyle,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderHelper.radiusCircular24,
                  borderSide: BorderHelper.borderSide),
              
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderHelper.borderSideLight,
                  borderRadius: BorderHelper.radiusCircular24)),
        ));
  }
}
