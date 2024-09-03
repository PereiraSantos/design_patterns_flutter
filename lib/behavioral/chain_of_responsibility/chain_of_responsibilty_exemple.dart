import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern/behavioral/chain_of_responsibility/debug_logger.dart';
import 'package:pattern/behavioral/chain_of_responsibility/errro_logger.dart';
import 'package:pattern/behavioral/chain_of_responsibility/info_logger.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_bloc.dart';
import 'package:pattern/behavioral/chain_of_responsibility/log_message.dart';
import 'package:pattern/behavioral/chain_of_responsibility/logger_base.dart';

class ChainOfResponsibiltyExemple extends StatefulWidget {
  const ChainOfResponsibiltyExemple({super.key});

  @override
  State<ChainOfResponsibiltyExemple> createState() => _ChainOfResponsibiltyExempleState();
}

class _ChainOfResponsibiltyExempleState extends State<ChainOfResponsibiltyExemple> {
  final logBloc = LogBloc();
  late final LoggerBase logger;

  @override
  void initState() {
    super.initState();

    logger = DebugLogger(
      logBloc,
      netLogger: InfoLogger(
        logBloc,
        netLogger: ErrorLogger(logBloc),
      ),
    );
  }

  @override
  void dispose() {
    logBloc.dispose();
    super.dispose();
  }

  String get randomLog => Random().nextInt(100).toString();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(onPressed: () => logger.logDebug(randomLog), child: const Text('log debug')),
          TextButton(onPressed: () => logger.logInfo(randomLog), child: const Text('log info')),
          TextButton(onPressed: () => logger.logError(randomLog), child: const Text('log erro')),
          Row(
            children: [
              Expanded(
                  child: StreamBuilder<List<LogMessage>>(
                initialData: const [],
                stream: logBloc.outLogStream,
                builder: (context, snapshot) => Text('${snapshot.data}'),
              ))
            ],
          )
        ],
      ),
    );
  }
}
