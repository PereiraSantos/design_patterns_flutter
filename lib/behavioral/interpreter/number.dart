import 'package:pattern/behavioral/interpreter/expression.dart';
import 'package:pattern/behavioral/interpreter/expression_context.dart';

class Number implements IExpression {
  const Number(this.number);

  final int number;
  @override
  int interpret(ExpressionContext context) => number;
}
