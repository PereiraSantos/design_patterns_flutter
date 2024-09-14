import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern/behavioral/command/command.dart';
import 'package:pattern/behavioral/command/shape.dart';

class ChangeColorCommad implements Command {
  ChangeColorCommad(this.shape) : previousColor = shape.color;

  final Color previousColor;
  Shape shape;

  @override
  void execute() =>
      shape.color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
  @override
  String getTitle() => 'Change color';

  @override
  void undo() => shape.color = previousColor;
}
