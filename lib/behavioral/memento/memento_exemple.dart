import 'package:flutter/material.dart';
import 'package:pattern/behavioral/memento/command.dart';
import 'package:pattern/behavioral/memento/command_history.dart';
import 'package:pattern/behavioral/memento/originator.dart';
import 'package:pattern/behavioral/memento/random_proprieties_command.dart';

class MementoExemple extends StatefulWidget {
  const MementoExemple({super.key});

  @override
  State<MementoExemple> createState() => _MementoExempleState();
}

class _MementoExempleState extends State<MementoExemple> {
  final _commandHistory = CommandHistory();
  final _originator = Originator();

  void randomiseProperties() {
    final command = RandomProprietiesCommand(_originator);
    _excuteCommand(command);
  }

  void _excuteCommand(ICommand command) => setState(() {
        command.execute();
        _commandHistory.add(command);
      });

  void undo() => setState(() {
        _commandHistory.undo();
      });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
