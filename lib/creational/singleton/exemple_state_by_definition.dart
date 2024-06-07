import 'package:pattern/creational/singleton/exenple_state_base.dart';

final class ExempleStateByDefinition extends ExempleStateBase {
  static ExempleStateByDefinition? _instance;

  ExempleStateByDefinition._internal() {
    initialText = "ExempleStateByDefinition criado";
    stateText = initialText;
  }

  static ExempleStateByDefinition getSate() {
    return _instance ??= ExempleStateByDefinition._internal();
  }
}
