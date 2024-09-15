import 'package:flutter/material.dart';
import 'package:pattern/behavioral/state/error_state.dart';
import 'package:pattern/behavioral/state/fake_api.dart';
import 'package:pattern/behavioral/state/istate.dart';
import 'package:pattern/behavioral/state/loaded_state.dart';
import 'package:pattern/behavioral/state/no_results_state.dart';
import 'package:pattern/behavioral/state/state_context.dart';

class LoadingState implements IState {
  const LoadingState({
    this.api = const FakeApi(),
  });

  final FakeApi api;

  @override
  Future<void> nextState(StateContext context) async {
    try {
      final resultList = await api.getNames();

      context.setState(
        resultList.isEmpty ? const NoResultsState() : LoadedState(resultList),
      );
    } on Exception {
      context.setState(const ErrorState());
    }
  }

  @override
  Widget render() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}
