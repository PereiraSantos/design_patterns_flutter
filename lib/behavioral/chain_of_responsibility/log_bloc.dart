import 'dart:async';
import 'dart:collection';

import 'package:pattern/behavioral/chain_of_responsibility/log_message.dart';

class LogBloc {
  final List<LogMessage> _log = [];
  final _logStream = StreamController<List<LogMessage>>();

  StreamSink<List<LogMessage>> get _inLogStream => _logStream.sink;
  Stream<List<LogMessage>> get outLogStream => _logStream.stream;

  void log(LogMessage logMessage) {
    _log.add(logMessage);
    _inLogStream.add(UnmodifiableListView(_log));
  }

  void dispose() {
    _logStream.close();
  }
}
