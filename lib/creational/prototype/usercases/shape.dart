import 'package:flutter/material.dart';

abstract class Shape {
  Color color;
  Shape(this.color);

  Shape clone();
  Shape.clone(Shape source) : color = source.color;

  void randomiseProperties();
  Widget render();
}
