import 'package:flutter/material.dart';
import 'package:pattern/behavioral/command/change_color_commad.dart';
import 'package:pattern/behavioral/command/change_height_command.dart';
import 'package:pattern/behavioral/command/change_width_command.dart';
import 'package:pattern/behavioral/command/command.dart';
import 'package:pattern/behavioral/command/commando_hisctory.dart';
import 'package:pattern/behavioral/command/shape.dart';

class CommandExemple extends StatefulWidget {
  const CommandExemple({super.key});

  @override
  State<CommandExemple> createState() => _CommandExempleState();
}

class _CommandExempleState extends State<CommandExemple> {
  final _commandHistory = CommandoHisctory();
  final _shape = Shape.initial();

  void _changeColor() {
    final command = ChangeColorCommad(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command) => setState(() {
        command.execute();
        _commandHistory.add(command);
      });

  void _undo() => setState(() {
        _commandHistory.undo();
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(onPressed: () => _changeColor, child: const Text('Change color')),
          TextButton(onPressed: () => _changeHeight, child: const Text('Change height')),
          TextButton(onPressed: () => _changeWidth, child: const Text('Change width')),
          TextButton(
              onPressed: () => _commandHistory.isEmpty ? null : _undo, child: const Text('Change undo')),
          ListView.builder(
            itemCount: _commandHistory.commandList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(_commandHistory.commandList[index]);
            },
          ),
        ],
      ),
    );
  }
}
