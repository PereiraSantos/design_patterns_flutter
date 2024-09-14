import 'package:pattern/behavioral/interpreter/expression_context.dart';

abstract interface class IExpression {
  int interpret(ExpressionContext context);
}
