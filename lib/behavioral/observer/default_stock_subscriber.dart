import 'package:pattern/behavioral/observer/stock.dart';
import 'package:pattern/behavioral/observer/stock_subscriber.dart';

class DefaultStockSubscriber extends StockSubscriber {
  DefaultStockSubscriber() {
    title = 'All stocks';
  }

  @override
  void update(Stock stock) {
    stockStreamController.add(stock);
  }
}
