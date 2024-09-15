import 'package:flutter/material.dart';
import 'package:pattern/behavioral/state/istate.dart';
import 'package:pattern/behavioral/state/loading_state.dart';
import 'package:pattern/behavioral/state/state_context.dart';

class LoadedState implements IState {
  const LoadedState(this.names);

  final List<String> names;

  @override
  Future<void> nextState(StateContext context) async {
    context.setState(const LoadingState());
  }

  @override
  Widget render() {
    return Column(
      children: names
          .map(
            (name) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  child: Text(name[0]),
                ),
                title: Text(name),
              ),
            ),
          )
          .toList(),
    );
  }
}
