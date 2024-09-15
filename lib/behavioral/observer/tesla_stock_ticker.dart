import 'dart:async';

import 'package:pattern/behavioral/observer/stock_ticker.dart';
import 'package:pattern/behavioral/observer/stock_ticker_symbal.dart';

final class TeslaStockTicker extends StockTicker {
  TeslaStockTicker() {
    title = StockTickerSymbol.TSLA.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        setStock(StockTickerSymbol.TSLA, 60000, 65000);
        notifySubscribers();
      },
    );
  }
}
