import 'package:flutter/material.dart';
import 'package:pattern/creational/singleton/exemple_state.dart';
import 'package:pattern/creational/singleton/exemple_state_by_definition.dart';
import 'package:pattern/creational/singleton/exemple_state_without_singleton.dart';
import 'package:pattern/creational/singleton/exenple_state_base.dart';

class SingletonExemple extends StatefulWidget {
  const SingletonExemple({super.key});

  @override
  State<SingletonExemple> createState() => _SingletonExempleState();
}

class _SingletonExempleState extends State<SingletonExemple> {
  final List<ExempleStateBase> stateList = [
    ExempleState(),
    ExempleStateByDefinition.getSate(),
    ExempleStateWithoutSingleton(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (final state in stateList) {
      state.setStateText(text);
    }

    setState(() {});
  }

  void _reset() {
    for (final state in stateList) {
      state.reset();
    }
    setState(() {});
  }

  style() {
    return ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.black54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Singleton')),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              for (final state in stateList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(state.currentText),
                      ),
                    ),
                  ),
                ),
              const Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton(
                  onPressed: _setTextValues, style: style(), child: const Text('Alterando o estado')),
              ElevatedButton(onPressed: _reset, style: style(), child: const Text('reset')),
            ],
          ),
        ),
      ),
    );
  }
}
