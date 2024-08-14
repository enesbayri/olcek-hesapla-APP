// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olcek_hesapla/widgets/HomeContents.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/bg3.jpg"),fit: BoxFit.fill)),
        child: const homeContentWidget(),
      ),
    );
  }
}
