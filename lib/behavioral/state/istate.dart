import 'package:flutter/material.dart';
import 'package:pattern/behavioral/state/state_context.dart';

abstract interface class IState {
  Future<void> nextState(StateContext context);
  Widget render();
}
