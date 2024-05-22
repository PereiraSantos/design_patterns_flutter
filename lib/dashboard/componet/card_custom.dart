import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({super.key, required this.child});

  final List<Widget> child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 05, right: 05),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [...child],
        ),
      ),
    );
  }
}
