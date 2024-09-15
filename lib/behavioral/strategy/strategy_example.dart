import 'package:flutter/material.dart';
import 'package:pattern/behavioral/strategy/in_store_pickup_strategy.dart';
import 'package:pattern/behavioral/strategy/percel_terminal_shipping_strategy.dart';
import 'package:pattern/behavioral/strategy/priority_shopping_stratgy.dart';
import 'package:pattern/behavioral/strategy/shipping_costs_strategy.dart';

import 'order.dart';
import 'order_item.dart';

class StrategyExample extends StatefulWidget {
  const StrategyExample();

  @override
  _StrategyExampleState createState() => _StrategyExampleState();
}

class _StrategyExampleState extends State<StrategyExample> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];
  var _selectedStrategyIndex = 0;
  var _order = Order();

  void _addToOrder() => setState(() => _order.addOrderItem(OrderItem.random()));

  void _clearOrder() => setState(() => _order = Order());

  void _setSelectedStrategyIndex(int? index) {
    if (index == null) return;
    setState(() => _selectedStrategyIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
