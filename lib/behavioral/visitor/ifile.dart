import 'package:flutter/material.dart';
import 'package:pattern/behavioral/visitor/visitor.dart';

abstract interface class IFile {
  int getSize();
  Widget render(BuildContext context);
  String accept(IVisitor visitor);
}
