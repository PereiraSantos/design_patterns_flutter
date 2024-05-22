import 'package:pattern/creational/abstract_factory/usercases/indicator.dart';
import 'package:pattern/creational/abstract_factory/usercases/widgets_factory.dart';
import 'package:pattern/creational/abstract_factory/usercases/slider.dart';
import 'package:pattern/creational/abstract_factory/usercases/switch.dart';

class AbstracFactoryController {
  final List<IWidgetsFactory> widgetsFactoryList = [MaterialWidgetsFactory(), CupertinoWidgetsFactory()];

  var selectFactoryIndex = 0;

  late IIndicator activityIndicator;

  late ISlider slider;
  var _sliderValue = 50.0;

  late ISwitch iSwitch;
  var _switchValue = false;

  String get sliderValueString => _sliderValue.toStringAsFixed(0);

  String get switchValueString => _switchValue ? 'ON' : 'OFF';

  set setSliderValue(double value) => _sliderValue = value;
  double get getSliderValue => _sliderValue;

  set setSwitchValue(bool value) => _switchValue = value;
  bool get getSwitchValue => _switchValue;

  void createWidgets() {
    activityIndicator = widgetsFactoryList[selectFactoryIndex].createActivityIndicator();
    slider = widgetsFactoryList[selectFactoryIndex].createSlider();
    iSwitch = widgetsFactoryList[selectFactoryIndex].createSwitch();
  }
}
