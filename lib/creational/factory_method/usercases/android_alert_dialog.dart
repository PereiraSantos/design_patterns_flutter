import 'package:flutter/material.dart';
import 'package:pattern/creational/factory_method/usercases/custon_dialog.dart';

class AndroidAlertDialog extends CustomDialog {
  const AndroidAlertDialog();

  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: const Text('Text material android'),
      actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('FECHAR'))],
    );
  }

  @override
  String getTitle() => 'Android alert Dialog';
}
