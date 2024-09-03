import 'package:pattern/behavioral/chain_of_responsibility/log_bloc.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_level.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_message.dart';
import 'package:pattern/behavioral/chain_of_responsibility/logger_base.dart';

class DebugLogger extends LoggerBase {
  DebugLogger(this.logBloc, {super.netLogger}) : super(logLevel: LogLevel.debug);

  final LogBloc logBloc;

  @override
  void log(String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);

    logBloc.log(logMessage);
  }
}
