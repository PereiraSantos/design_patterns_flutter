import 'dart:async';

import 'package:pattern/behavioral/observer/stock_ticker.dart';
import 'package:pattern/behavioral/observer/stock_ticker_symbal.dart';

final class GameStopStockTicker extends StockTicker {
  GameStopStockTicker() {
    title = StockTickerSymbol.GME.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        setStock(StockTickerSymbol.GME, 16000, 22000);
        notifySubscribers();
      },
    );
  }
}
