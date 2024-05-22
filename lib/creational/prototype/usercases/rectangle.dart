import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern/creational/prototype/usercases/shape.dart';

class Rectangle extends Shape {
  double height;
  double width;

  Rectangle(super.color, this.height, this.width);

  Rectangle.initial([super.color = Colors.black])
      : height = 100.0,
        width = 100.0;

  Rectangle.clone(Rectangle source)
      : height = source.height,
        width = source.width,
        super.clone(source);

  @override
  Shape clone() => Rectangle.clone(this);

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);

    height = Random().nextInt(100) + 50.toDouble();
    width = Random().nextInt(100) + 50.toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: height,
          width: width,
          decoration: BoxDecoration(color: color),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
