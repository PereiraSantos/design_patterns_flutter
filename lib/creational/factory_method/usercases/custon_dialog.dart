import 'package:flutter/material.dart';

abstract class CustomDialog {
  const CustomDialog();

  String getTitle();

  Widget create(BuildContext context);

  Future<void> show(BuildContext context) => showDialog(context: context, barrierDismissible: false, builder: create);
}
