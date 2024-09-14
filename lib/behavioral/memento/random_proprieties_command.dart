import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern/behavioral/memento/command.dart';
import 'package:pattern/behavioral/memento/imemento.dart';
import 'package:pattern/behavioral/memento/originator.dart';

class RandomProprietiesCommand implements ICommand {
  RandomProprietiesCommand(this.originator) : _backup = originator.createMemento();

  final Originator originator;
  final IMemento _backup;

  @override
  void execute() {
    final shape = originator.state;

    shape.color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);

    shape.height = (Random().nextInt(255) + 50).toDouble();
    shape.width = (Random().nextInt(255) + 50).toDouble();
  }

  @override
  void undo() => originator.restore(_backup);
}
