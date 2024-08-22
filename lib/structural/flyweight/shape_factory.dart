import 'package:flutter/material.dart';
import 'package:pattern/structural/flyweight/circle.dart';
import 'package:pattern/structural/flyweight/positioned_shape.dart';
import 'package:pattern/structural/flyweight/shape_type.dart';
import 'package:pattern/structural/flyweight/square.dart';

class ShapeFactory {
  const ShapeFactory();

  IPositionedShape createShape(ShapeType shapeType) => switch (shapeType) {
        ShapeType.circle => Circle(color: Colors.red, diameter: 10.0),
        ShapeType.square => Square(color: Colors.blue, width: 10.0),
      };
}
