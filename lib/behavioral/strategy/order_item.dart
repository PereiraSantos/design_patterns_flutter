import 'dart:math';

import 'package:pattern/behavioral/strategy/package_size.dart';

class OrderItem {
  const OrderItem({
    required this.title,
    required this.price,
    required this.packageSize,
  });

  final String title;
  final double price;
  final PackageSize packageSize;

  factory OrderItem.random() {
    const packageSizeList = PackageSize.values;

    return OrderItem(
      title: (Random().nextInt(250) + 100).toString(),
      price: (Random().nextInt(250) + 1),
      packageSize: packageSizeList[Random().nextInt(packageSizeList.length)],
    );
  }
}
