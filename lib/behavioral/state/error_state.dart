import 'package:flutter/material.dart';
import 'package:pattern/behavioral/state/istate.dart';
import 'package:pattern/behavioral/state/loading_state.dart';
import 'package:pattern/behavioral/state/state_context.dart';

class ErrorState implements IState {
  const ErrorState();

  @override
  Future<void> nextState(StateContext context) async {
    context.setState(const LoadingState());
  }

  @override
  Widget render() {
    return const Text(
      'Oops! Something went wrong...',
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
