import 'package:pattern/behavioral/chain_of_responsibility/log_bloc.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_level.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_message.dart';

class MailService {
  const MailService(this.logBloc);

  final LogBloc logBloc;

  void sendErrorMail(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);

    logBloc.log(logMessage);
  }
}
