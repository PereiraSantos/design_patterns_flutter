import 'dart:async';

import 'package:pattern/behavioral/observer/stock_ticker.dart';
import 'package:pattern/behavioral/observer/stock_ticker_symbal.dart';

final class GoogleStockTicker extends StockTicker {
  GoogleStockTicker() {
    title = StockTickerSymbol.GOOGL.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        setStock(StockTickerSymbol.GOOGL, 200000, 204000);
        notifySubscribers();
      },
    );
  }
}
