import 'package:pattern/structural/flyweight/positioned_shape.dart';
import 'package:pattern/structural/flyweight/shape_factory.dart';
import 'package:pattern/structural/flyweight/shape_type.dart';

class ShapeFlyweightFactory {
  ShapeFlyweightFactory({required this.shapeFactory});

  final ShapeFactory shapeFactory;
  final Map<ShapeType, IPositionedShape> shapesMap = {};

  IPositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory.createShape(shapeType);
    }

    return shapesMap[shapeType]!;
  }

  int getShapeInstanceCount() => shapesMap.length;
}
