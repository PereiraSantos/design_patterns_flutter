import 'dart:math';

import 'package:pattern/structural/bridge/entity_base.dart';
import 'package:pattern/structural/bridge/fake.dart';

class Order extends EntityBase {
  Order()
      : dishes = List.generate(
          Random().nextInt(100) + 1,
          (_) => random(),
        ),
        total = Random().nextDouble() * 500;

  final List<String> dishes;
  final double total;

  Order.fromJson(super.json)
      : dishes = List.from(json['dishes'] as List),
        total = json['total'] as double,
        super.fromJson();

  Map<String, dynamic> toJson() => {
        'id': id,
        'dishes': dishes,
        'total': total,
      };
}
