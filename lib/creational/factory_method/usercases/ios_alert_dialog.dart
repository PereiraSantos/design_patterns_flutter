import 'package:flutter/cupertino.dart';
import 'package:pattern/creational/factory_method/usercases/custon_dialog.dart';

class IosAlertDialog extends CustomDialog {
  const IosAlertDialog();

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: const Text('Cupertio ios dialog'),
      actions: [
        CupertinoButton(
          onPressed: Navigator.of(context).pop,
          child: const Text("FECHAR"),
        )
      ],
    );
  }

  @override
  String getTitle() => 'Ios alert dialog';
}
