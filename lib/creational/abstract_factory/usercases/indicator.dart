import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract interface class IIndicator {
  Widget render();
}

class AndroidIndicator implements IIndicator {
  const AndroidIndicator();

  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: const Color(0xFFECECEC),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black.withOpacity(0.65)),
    );
  }
}

class IosIndicator implements IIndicator {
  const IosIndicator();

  @override
  Widget render() {
    return const CupertinoActivityIndicator();
  }
}
