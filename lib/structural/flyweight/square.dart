import 'package:flutter/material.dart';
import 'package:pattern/structural/flyweight/positioned_shape.dart';

class Square implements IPositionedShape {
  Square({required this.color, required this.width});

  final Color color;
  final double width;

  double get _height => width;

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(height: _height, width: width),
    );
  }
}
