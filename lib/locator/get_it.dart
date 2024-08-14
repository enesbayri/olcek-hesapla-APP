import 'package:olcek_hesapla/database/HiveStorage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void locatorSetup() {
  locator.registerSingleton<HiveStorage>(HiveStorage());
}