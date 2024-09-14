import 'dart:collection';

import 'package:pattern/behavioral/interpreter/add.dart';
import 'package:pattern/behavioral/interpreter/expression.dart';
import 'package:pattern/behavioral/interpreter/multiply.dart';
import 'package:pattern/behavioral/interpreter/number.dart';
import 'package:pattern/behavioral/interpreter/subtract.dart';

class ExpressionHelps {
  const ExpressionHelps._();

  static final List<String> _operatiors = ['+', '-', '*'];

  static IExpression buildExperessionTree(String postExpression) {
    final expressionStack = ListQueue<IExpression>();

    for (final symbol in postExpression.split('')) {
      if (_isOperator(symbol)) {
        final rightExpression = expressionStack.removeLast();
        final leftExpression = expressionStack.removeLast();
        final nonteminalExpression = _getNonterminalExpression(symbol, leftExpression, rightExpression);

        expressionStack.addLast((nonteminalExpression));
      } else {
        final numberExpresion = Number(int.parse(symbol));

        expressionStack.addLast(numberExpresion);
      }
    }

    return expressionStack.single;
  }

  static bool _isOperator(String symbol) {
    return _operatiors.contains(symbol);
  }

  static IExpression _getNonterminalExpression(
    String symbol,
    IExpression leftExpression,
    IExpression rightExpression,
  ) =>
      switch (symbol) {
        '+' => Add(leftExpression, rightExpression),
        '-' => Subtract(leftExpression, rightExpression),
        '*' => Multiply(leftExpression, rightExpression),
        _ => throw Exception('Expression is not defined')
      };
}
