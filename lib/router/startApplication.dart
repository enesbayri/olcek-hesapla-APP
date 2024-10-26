
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/pages/HomePage.dart';
import 'package:olcek_hesapla/pages/LoadingPage.dart';

class StartApplication extends StatelessWidget {
  const StartApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadingTime(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const HomePage();
        }else{
          return const LoadingPage();
        }
      },
    
    );
  }

  Future<int> loadingTime(){
    return Future.delayed(const Duration(milliseconds: 1000),(){
      return 1;
    });
  }
}