import 'package:pattern/behavioral/strategy/shipping_costs_strategy.dart';

import 'order.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) => 9.99;
}
