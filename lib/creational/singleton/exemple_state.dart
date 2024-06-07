import 'package:pattern/creational/singleton/exenple_state_base.dart';

final class ExempleState extends ExempleStateBase {
  static final ExempleState _instance = ExempleState._internal();

  factory ExempleState() {
    return _instance;
  }

  ExempleState._internal() {
    initialText = "ExempleState criado";
    stateText = initialText;
  }
}
