// ignore_for_file: unnecessary_cast

import 'package:flutter/cupertino.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:olcek_hesapla/widgets/scanner_widget.dart';


class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScannerScreenState();
  }
}

class ScannerScreenState extends State<ScannerScreen>
with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  // ignore: unused_field
  
  String scanText = "Scan";
  bool scanning = true;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animateScanAnimation(false);
    return SafeArea(
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: ColorUiHelper.primaryContentColor, width: 7),
                          ),
                              
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                            width: 334,
                            image: AssetImage("assets/images/calcuteLoading.gif"),fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  ScannerAnimation(
                  348,
                  animation: _animationController as Animation<double>,
                ),
                
                
                ]),
                
              ])),
    );
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}