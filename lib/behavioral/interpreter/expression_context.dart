class ExpressionContext {
  final List<String> _solutionSteps = [];

  List<String> getSolutionStep() => _solutionSteps;

  void addSolutionStep(String operatorSymbol, int left, int right, int result) {
    final solutionStep = '${_solutionSteps.length + 1} $left $operatorSymbol $right = $result';

    _solutionSteps.add(solutionStep);
  }
}
