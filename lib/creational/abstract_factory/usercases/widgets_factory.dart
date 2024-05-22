import 'package:pattern/creational/abstract_factory/usercases/indicator.dart';
import 'package:pattern/creational/abstract_factory/usercases/slider.dart';
import 'package:pattern/creational/abstract_factory/usercases/switch.dart';

abstract interface class IWidgetsFactory {
  IIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}

class MaterialWidgetsFactory implements IWidgetsFactory {
  MaterialWidgetsFactory();

  @override
  createActivityIndicator() => const AndroidIndicator();

  @override
  createSlider() => const AndroidSlider();

  @override
  createSwitch() => const AndroidSwitch();
}

class CupertinoWidgetsFactory implements IWidgetsFactory {
  CupertinoWidgetsFactory();

  @override
  IIndicator createActivityIndicator() => const IosIndicator();
  @override
  createSlider() => const IosSlider();

  @override
  createSwitch() => const IosSwitch();
}
