import 'package:flutter/material.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_level.dart';

class LogMessage {
  const LogMessage({
    required this.logLevel,
    required this.message,
  });

  final LogLevel logLevel;
  final String message;

  String get _logLevelString => logLevel.toString().split('.').last.toLowerCase();

  Color _getLogEntryColor() => switch (logLevel) {
        LogLevel.debug => Colors.grey,
        LogLevel.info => Colors.blue,
        LogLevel.error => Colors.red,
      };

  Widget getFormattedMessage() => Text(
        '$_logLevelString: $message',
        style: TextStyle(color: _getLogEntryColor()),
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
}
