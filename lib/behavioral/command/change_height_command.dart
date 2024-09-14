import 'dart:math';

import 'package:pattern/behavioral/command/command.dart';
import 'package:pattern/behavioral/command/shape.dart';

class ChangeHeightCommand implements Command {
  ChangeHeightCommand(this.shape) : previousHeight = shape.height;

  final double previousHeight;
  Shape shape;

  @override
  void execute() => shape.height = (Random().nextInt(150) + 50).toDouble();
  @override
  String getTitle() => 'Change height';

  @override
  void undo() => shape.height = previousHeight;
}
