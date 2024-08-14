import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olcek_hesapla/database/HiveStorage.dart';
import 'package:olcek_hesapla/locator/get_it.dart';
import 'package:olcek_hesapla/models/calcute.dart';
import 'package:olcek_hesapla/router/startApplication.dart';
import 'package:olcek_hesapla/uiHelper/colorUiHelper.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter("CalcuteScale");
  Hive.registerAdapter(calcuteAdapter());
  await Hive.openBox<calcute>("calcutes");
  await Hive.openBox<String>("primaryColor");
  locatorSetup();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: ColorUiHelper.ContentBackgroundColor));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    HiveStorage storage = locator<HiveStorage>();
    ColorUiHelper.primaryContentColor =storage.getPrimaryColorFromStorage(); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StartApplication(),
  
    );
  }
}


