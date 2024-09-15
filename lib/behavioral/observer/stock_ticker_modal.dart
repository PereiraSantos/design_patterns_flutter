import 'package:pattern/behavioral/observer/stock_ticker.dart';

class StockTickerModel {
  StockTicker? stockTicker;

  StockTickerModel({this.stockTicker});

  bool get subscribed => subscribed;

  void toggleSubscribed() {}
}
