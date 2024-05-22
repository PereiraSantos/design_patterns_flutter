import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  const TitleCustom({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
