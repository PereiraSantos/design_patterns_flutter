import 'package:pattern/behavioral/chain_of_responsibility/log_bloc.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_level.dart';
import 'package:pattern/behavioral/chain_of_responsibility/logger_base.dart';
import 'package:pattern/behavioral/chain_of_responsibility/mail_service.dart';

class ErrorLogger extends LoggerBase {
  ErrorLogger(LogBloc logBloc, {super.netLogger})
      : mailService = MailService(logBloc),
        super(logLevel: LogLevel.error);

  final MailService mailService;

  @override
  void log(String message) {
    mailService.sendErrorMail(logLevel, message);
  }
}
