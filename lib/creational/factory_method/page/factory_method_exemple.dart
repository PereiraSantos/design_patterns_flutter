import 'package:flutter/material.dart';
import 'package:pattern/creational/factory_method/enum/mobile.dart';
import 'package:pattern/creational/factory_method/usercases/android_alert_dialog.dart';
import 'package:pattern/creational/factory_method/usercases/custon_dialog.dart';
import 'package:pattern/creational/factory_method/usercases/ios_alert_dialog.dart';

class FactoryMethodExemple extends StatefulWidget {
  const FactoryMethodExemple({super.key});

  @override
  State<FactoryMethodExemple> createState() => _FactoryMethodExempleState();
}

class _FactoryMethodExempleState extends State<FactoryMethodExemple> {
  final List<CustomDialog> custonDialogList = const [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  Mobile _mobile = Mobile.android;

  var _selectDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    final selectedDialog = custonDialogList[_selectDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(Mobile? mobile) {
    if (mobile == null) return;

    setState(() {
      _mobile = mobile;
      _selectDialogIndex = mobile.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Factory Method")),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListTile(
                title: Text(Mobile.android.name),
                leading: Radio<Mobile>(
                  activeColor: Colors.black,
                  value: Mobile.android,
                  groupValue: _mobile,
                  onChanged: (value) => _setSelectedDialogIndex(value),
                ),
              ),
              ListTile(
                title: Text(Mobile.ios.name),
                leading: Radio<Mobile>(
                  activeColor: Colors.black,
                  value: Mobile.ios,
                  groupValue: _mobile,
                  onChanged: (value) => _setSelectedDialogIndex(value),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () => _showCustomDialog(context),
                child: const Text('Mostrar dialogo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
