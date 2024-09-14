import 'dart:math';

import 'package:pattern/behavioral/command/command.dart';
import 'package:pattern/behavioral/command/shape.dart';

class ChangeWidthCommand implements Command {
  ChangeWidthCommand(this.shape) : previousWidth = shape.height;

  final double previousWidth;
  Shape shape;

  @override
  void execute() => shape.height = (Random().nextInt(150) + 50).toDouble();

  @override
  String getTitle() => 'Change wight';

  @override
  void undo() => shape.height = previousWidth;
}
