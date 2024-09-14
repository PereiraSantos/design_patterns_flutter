import 'package:pattern/behavioral/memento/imemento.dart';
import 'package:pattern/behavioral/memento/shape.dart';

class Memento implements IMemento {
  Memento(Shape shape) : _state = Shape.copy(shape);

  final Shape _state;

  @override
  Shape getState() => _state;
}
