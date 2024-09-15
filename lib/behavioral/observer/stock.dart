import 'package:pattern/behavioral/observer/stock_change_direction.dart';
import 'package:pattern/behavioral/observer/stock_ticker_symbal.dart';

class Stock {
  const Stock({
    required this.symbol,
    required this.changeDirection,
    required this.price,
    required this.changeAmount,
  });

  final StockTickerSymbol symbol;
  final StockChangeDirection changeDirection;
  final double price;
  final double changeAmount;
}
