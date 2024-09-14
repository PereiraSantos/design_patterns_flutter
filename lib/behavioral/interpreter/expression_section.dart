import 'package:flutter/material.dart';
import 'package:pattern/behavioral/interpreter/expression_context.dart';
import 'package:pattern/behavioral/interpreter/expression_helps.dart';

class ExpressionSection extends StatefulWidget {
  const ExpressionSection({super.key, required this.postFixExpression});

  final String postFixExpression;

  @override
  State<ExpressionSection> createState() => _ExpressionSectionState();
}

class _ExpressionSectionState extends State<ExpressionSection> {
  final _expessionContext = ExpressionContext();
  final List<String> _solutionSteps = [];

  void _solvePrefixExpression() {
    final solutionSteps = <String>[];
    final expression = ExpressionHelps.buildExperessionTree(widget.postFixExpression);
    final result = expression.interpret(_expessionContext);

    solutionSteps
      ..addAll(_expessionContext.getSolutionStep())
      ..add('Result : $result');

    setState(() {
      _solutionSteps.addAll(solutionSteps);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.postFixExpression,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          firstChild: TextButton(onPressed: () => _solvePrefixExpression(), child: const Text('Solve')),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final solutionStep in _solutionSteps)
                Text(
                  solutionStep,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
            ],
          ),
          crossFadeState: _solutionSteps.isEmpty ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ],
    );
  }
}
