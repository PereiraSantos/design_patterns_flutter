import 'package:flutter/material.dart';
import 'package:pattern/creational/prototype/usercases/circle.dart';
import 'package:pattern/creational/prototype/usercases/rectangle.dart';
import 'package:pattern/creational/prototype/usercases/shape.dart';

class PrototypeExemple extends StatefulWidget {
  const PrototypeExemple({super.key});

  @override
  State<PrototypeExemple> createState() => _PrototypeExempleState();
}

class _PrototypeExempleState extends State<PrototypeExemple> {
  final _circle = Circle.initial();
  final _rectanngle = Rectangle.initial();

  Shape? _circleClone;
  Shape? _rectanngleClone;

  void _randomiseCircleProperties() => setState(() => _circle.randomiseProperties());

  void _cloneCircle() => setState(() => _circleClone = _circle.clone());

  void _randomiseRectangleProperties() => setState(() => _rectanngle.randomiseProperties());

  void _cloneRectangle() => setState(() => _rectanngleClone = _rectanngle.clone());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prototype')),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _circle.render(),
                  if (_circleClone != null) ...[_circleClone!.render()],
                  if (_circleClone == null) ...[Container(height: 100, width: 100, color: Colors.grey)]
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => _randomiseCircleProperties(), child: const Text('ALTERA')),
                  ElevatedButton(onPressed: () => _cloneCircle(), child: const Text('CLONE')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _rectanngle.render(),
                  if (_rectanngleClone != null) ...[_rectanngleClone!.render()],
                  if (_rectanngleClone == null) ...[Container(height: 100, width: 100, color: Colors.grey)]
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => _randomiseRectangleProperties(), child: const Text('ALTERA')),
                  ElevatedButton(onPressed: () => _cloneRectangle(), child: const Text('CLONE')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
