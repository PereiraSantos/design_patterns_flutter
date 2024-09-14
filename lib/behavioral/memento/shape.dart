import 'package:flutter/material.dart';

class Shape {
  Shape.initial()
      : color = Colors.black,
        height = 150,
        width = 150;

  Shape.copy(Shape shape)
      : color = shape.color,
        height = shape.height,
        width = shape.width;

  Color color;
  double height;
  double width;
}
