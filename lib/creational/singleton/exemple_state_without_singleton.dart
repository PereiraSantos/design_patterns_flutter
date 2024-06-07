import 'package:pattern/creational/singleton/exenple_state_base.dart';

final class ExempleStateWithoutSingleton extends ExempleStateBase {
  ExempleStateWithoutSingleton() {
    initialText = "ExempleStateWithoutSingleton criado";
    stateText = initialText;
  }
}
