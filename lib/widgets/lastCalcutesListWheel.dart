// ignore_for_file: file_names, sort_child_properties_last, deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:olcek_hesapla/database/HiveStorage.dart';
import 'package:olcek_hesapla/locator/get_it.dart';
import 'package:olcek_hesapla/models/calcute.dart';
import 'package:olcek_hesapla/uiHelper/borderHelper.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';

class LastCalcuteListView extends StatefulWidget {
  const LastCalcuteListView({super.key});

  @override
  State<LastCalcuteListView> createState() => _LastCalcuteListViewState();
}

class _LastCalcuteListViewState extends State<LastCalcuteListView> {
  final HiveStorage database = locator<HiveStorage>();
  List<calcute> calcutes = [];

  @override
  Widget build(BuildContext context) {
    calcutes = database.getCalcutesfromStorage().reversed.toList();
    return calcutes.isEmpty
        ? Center(
            child: Text(
              "HESAPLAMANIZ BULUNMAMAKTADIR!",
              style: TextStyleHelper.BoldTextStyle,
            ),
          )
        : ListWheelScrollView(
            children: lastCalcutes(),
            scrollBehavior: const ScrollBehavior(),
            itemExtent: 75,
            perspective: 0.005,
            diameterRatio: 1.5,
            //offAxisFraction:-3.5,
            physics: const FixedExtentScrollPhysics(),
          );
  }

  List<Widget> lastCalcutes() {
    List<Widget> lastCalcutes = [];
    lastCalcutes = calcutes
        .map((clcte) => Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                database.deletefromStorage(
                    database.getCalcutesfromStorage().toList().indexOf(clcte));
              });
            },
            background: Container(
              decoration: BoxDecoration(
                  color: ColorUiHelper.DismisseCalcuteColor.withOpacity(0.7),
                  borderRadius: BorderHelper.radiusCircular16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.delete_forever,
                      color: ColorUiHelper.headerFromBetweentoIconColor,
                    ),
                    Text(
                      "GEÇMİŞTEN SİLİNDİ!",
                      style: TextStyleHelper.DismisseCalcuteTextStyle,
                    ),
                  ]),
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0), // Dikey boşluk ekliyoruz
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: ColorUiHelper.lastCalcuteLeadingColor,
                      child: Text(
                        "${clcte.created.day}/${clcte.created.month}",
                        style: TextStyleHelper.LastCalcuteDateTextStyle,
                      ),
                    ),
                    const SizedBox(
                        width:
                            16), // Leading ile ortadaki metin arasında boşluk
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Metni ortalıyoruz
                        children: [
                          Flexible(
                            flex: 2,
                            child: clcte.scalePre != null
                                ? AutoSizeText(
                                    "${clcte.measure}   1/${clcte.scalePre} ${clcte.convertFrom} -> 1/${1 / clcte.scale!} ${clcte.convertTo}",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.visible),
                                  )
                                : (clcte.scale != null
                                    ? AutoSizeText(
                                        clcte.convertFrom == "ÖLÇEK"
                                            ? "${clcte.measure}    1/${clcte.scale!} ${clcte.convertFrom} -> ${clcte.convertTo}"
                                            : "${clcte.measure}    ${clcte.convertFrom} -> 1/${1 / clcte.scale!} ${clcte.convertTo}",
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.visible),
                                      )
                                    : AutoSizeText(
                                        "${clcte.measure}    ${clcte.convertFrom} -> ${clcte.convertTo}",
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.visible),
                                      )),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: AutoSizeText("= ${clcte.answer}",
                                  maxLines: 1, overflow: TextOverflow.visible),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        width:
                            16), // Ortadaki metin ile trailing arasında boşluk
                    Icon(
                      Icons.check_circle_outline,
                      color: ColorUiHelper.primaryContentColor.withOpacity(0.5),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            )))
        .toList();
    return lastCalcutes;
  }
}
