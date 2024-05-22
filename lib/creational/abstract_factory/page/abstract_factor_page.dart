import 'package:flutter/material.dart';
import 'package:pattern/creational/abstract_factory/controller/abstract_factory_controller.dart';
import 'package:pattern/creational/abstract_factory/enum/mobile.dart';

class AbstractFactoryPage extends StatefulWidget {
  const AbstractFactoryPage({super.key});

  @override
  State<AbstractFactoryPage> createState() => _AbstractFactoryPageState();
}

class _AbstractFactoryPageState extends State<AbstractFactoryPage> {
  final AbstracFactoryController abstracFactoryController = AbstracFactoryController();

  Mobile _mobile = Mobile.android;

  @override
  void initState() {
    super.initState();
    abstracFactoryController.createWidgets();
  }

  void setSelectedFactoryIndex(Mobile? mobile) {
    if (mobile == null) return;

    setState(() {
      _mobile = mobile;
      abstracFactoryController.selectFactoryIndex = mobile.index;
      abstracFactoryController.createWidgets();
    });
  }

  void _setSliderValue(double value) => setState(() {
        abstracFactoryController.setSliderValue = value;
      });

  void _setSwitchValue(bool value) => setState(() {
        abstracFactoryController.setSwitchValue = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("abstract factory")),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(Mobile.android.name),
                leading: Radio<Mobile>(
                  activeColor: Colors.black,
                  value: Mobile.android,
                  groupValue: _mobile,
                  onChanged: (value) => setSelectedFactoryIndex(value),
                ),
              ),
              ListTile(
                title: Text(Mobile.ios.name),
                leading: Radio<Mobile>(
                  activeColor: Colors.black,
                  value: Mobile.ios,
                  groupValue: _mobile,
                  onChanged: (value) => setSelectedFactoryIndex(value),
                ),
              ),
              const SizedBox(height: 20),
              Text("Widgtes showcase", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Text("Process indicator", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              abstracFactoryController.activityIndicator.render(),
              const SizedBox(height: 20),
              Text("slider ${abstracFactoryController.sliderValueString}"),
              abstracFactoryController.slider.render(abstracFactoryController.getSliderValue, (value) => _setSliderValue(value)),
              Text("Switch ${abstracFactoryController.switchValueString}"),
              abstracFactoryController.iSwitch.render(value: abstracFactoryController.getSwitchValue, onChanged: (value) => _setSwitchValue(value)),
            ],
          ),
        ),
      ),
    );
  }
}
