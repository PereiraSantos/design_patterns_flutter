import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pattern/behavioral/observer/default_stock_subscriber.dart';
import 'package:pattern/behavioral/observer/game_stop_tocker_ticker.dart';
import 'package:pattern/behavioral/observer/google_stock_ticker.dart';
import 'package:pattern/behavioral/observer/growing_stock_subscriber.dart';
import 'package:pattern/behavioral/observer/stock.dart';
import 'package:pattern/behavioral/observer/stock_subscriber.dart';
import 'package:pattern/behavioral/observer/stock_ticker_modal.dart';
import 'package:pattern/behavioral/observer/tesla_stock_ticker.dart';

class ObserverExemple extends StatefulWidget {
  const ObserverExemple({super.key});

  @override
  State<ObserverExemple> createState() => _ObserverExempleState();
}

class _ObserverExempleState extends State<ObserverExemple> {
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowingStockSubscriber(),
  ];
  final _stockTickers = <StockTickerModel>[
    StockTickerModel(stockTicker: GameStopStockTicker()),
    StockTickerModel(stockTicker: GoogleStockTicker()),
    StockTickerModel(stockTicker: TeslaStockTicker()),
  ];
  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;
  StockSubscriber _subscriber = DefaultStockSubscriber();
  var _selectedSubscriberIndex = 0;

  @override
  void initState() {
    super.initState();

    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {
    for (final ticker in _stockTickers) {
      ticker.stockTicker!.stopTicker();
    }

    _stockStreamSubscription?.cancel();

    super.dispose();
  }

  void _onStockChange(Stock stock) => setState(() => _stockEntries.add(stock));

  void _setSelectedSubscriberIndex(int? index) {
    for (final ticker in _stockTickers) {
      if (ticker.subscribed) {
        ticker.toggleSubscribed();
        ticker.stockTicker?.unsubscribe(_subscriber);
      }
    }

    _stockStreamSubscription?.cancel();

    setState(() {
      _stockEntries.clear();
      _selectedSubscriberIndex = index!;
      _subscriber = _stockSubscriberList[_selectedSubscriberIndex];
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTickerSelection(int index) {
    final stockTickerModel = _stockTickers[index];
    final stockTicker = stockTickerModel.stockTicker;

    if (stockTickerModel.subscribed) {
      stockTicker?.unsubscribe(_subscriber);
    } else {
      stockTicker?.subscribe(_subscriber);
    }

    setState(() => stockTickerModel.toggleSubscribed());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
