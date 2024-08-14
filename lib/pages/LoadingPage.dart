// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/uiHelper/textstyleUiHelper.dart';
import 'package:olcek_hesapla/widgets/scanner_screen.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(children: [
        const ScannerScreen(),
        Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ColorUiHelper.primaryContentColor, width: 6)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Ölçek & Ölçü",style:TextStyleHelper.TitleStyle,),
                    Text("Hesaplama",style:TextStyleHelper.TitleStyle)
                  ],),
                  
                  

            ),
        )
      ])
    );
  }
}