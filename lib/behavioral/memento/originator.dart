import 'package:pattern/behavioral/memento/imemento.dart';
import 'package:pattern/behavioral/memento/memento.dart';
import 'package:pattern/behavioral/memento/shape.dart';

class Originator {
  Originator() : state = Shape.initial();

  Shape state;

  IMemento createMemento() => Memento(state);

  void restore(IMemento memento) => state = memento.getState();
}
