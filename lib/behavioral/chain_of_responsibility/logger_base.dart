import 'package:flutter/material.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_level.dart';

abstract class LoggerBase {
  const LoggerBase({required this.logLevel, LoggerBase? netLogger}) : _netLogger = netLogger;

  @protected
  final LogLevel logLevel;
  final LoggerBase? _netLogger;

  void logMessage(LogLevel level, String message) {
    if (logLevel <= level) log(message);

    _netLogger?.logMessage(level, message);
  }

  void logDebug(String message) => logMessage(LogLevel.debug, message);
  void logInfo(String message) => logMessage(LogLevel.info, message);
  void logError(String message) => logMessage(LogLevel.error, message);

  void log(String message);
}
