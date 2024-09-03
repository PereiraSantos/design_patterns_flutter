import 'package:pattern/behavioral/chain_of_responsibility/external_logging_service.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_bloc.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_level.dart';
import 'package:pattern/behavioral/chain_of_responsibility/logger_base.dart';

class InfoLogger extends LoggerBase {
  InfoLogger(LogBloc logBloc, {super.netLogger})
      : externalLoggingService = ExternalLoggingService(logBloc),
        super(logLevel: LogLevel.info);

  final ExternalLoggingService externalLoggingService;

  @override
  void log(String message) {
    externalLoggingService.logMessage(logLevel, message);
  }
}
