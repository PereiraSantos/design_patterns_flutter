import 'package:flutter/material.dart';
import 'package:pattern/behavioral/strategy/shipping_costs_strategy.dart';

class ShippingOptions extends StatelessWidget {
  final List<IShippingCostsStrategy> shippingOptions;
  final int selectedIndex;
  final ValueChanged<int?> onChanged;

  const ShippingOptions({
    required this.shippingOptions,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select shipping type:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final (i, option) in shippingOptions.indexed)
              RadioListTile<int>(
                title: Text(option.label),
                value: i,
                groupValue: selectedIndex,
                onChanged: onChanged,
                dense: true,
                activeColor: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}