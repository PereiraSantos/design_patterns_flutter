import 'package:pattern/behavioral/strategy/order.dart';
import 'package:pattern/behavioral/strategy/shipping_costs_strategy.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-store pickup';

  @override
  double calculate(Order order) => 0.0;
}
