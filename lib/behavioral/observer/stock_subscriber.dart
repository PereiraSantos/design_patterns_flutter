import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern/behavioral/observer/stock.dart';

abstract class StockSubscriber {
  late final String title;

  final id = Random().nextInt(150);

  @protected
  final StreamController<Stock> stockStreamController = StreamController.broadcast();

  Stream<Stock> get stockStream => stockStreamController.stream;

  void update(Stock stock);
}
