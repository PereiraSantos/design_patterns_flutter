import 'package:flutter/material.dart';
import 'package:pattern/behavioral/strategy/shipping_costs_strategy.dart';

import 'order.dart';

class OrderSummary extends StatelessWidget {
  final Order order;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummary({
    required this.order,
    required this.shippingCostsStrategy,
  });

  double get shippingPrice => shippingCostsStrategy.calculate(order);
  double get total => order.price + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
