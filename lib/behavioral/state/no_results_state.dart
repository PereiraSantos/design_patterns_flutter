import 'package:flutter/material.dart';
import 'package:pattern/behavioral/state/istate.dart';
import 'package:pattern/behavioral/state/loading_state.dart';
import 'package:pattern/behavioral/state/state_context.dart';

class NoResultsState implements IState {
  const NoResultsState();

  @override
  Future<void> nextState(StateContext context) async {
    context.setState(const LoadingState());
  }

  @override
  Widget render() {
    return const Text(
      'No Results',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}
