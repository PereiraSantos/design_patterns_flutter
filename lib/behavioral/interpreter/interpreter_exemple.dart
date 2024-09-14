import 'package:flutter/material.dart';
import 'package:pattern/behavioral/interpreter/expression_section.dart';

class InterpreterExemple extends StatefulWidget {
  const InterpreterExemple({super.key});

  @override
  State<InterpreterExemple> createState() => _InterpreterExempleState();
}

class _InterpreterExempleState extends State<InterpreterExemple> {
  final List<String> _postFixExpression = [
    '20 3 5 * 2 3 * +',
    '1 1 1 1 1 + + + * 2 -',
    '123 12 1 -- 12 9 *-',
    '9 8 7 6 5 4 3 2 1 +-+-+-',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final postFixExpression in _postFixExpression)
            ExpressionSection(postFixExpression: postFixExpression)
        ],
      ),
    );
  }
}
