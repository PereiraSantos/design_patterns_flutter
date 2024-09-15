import 'package:flutter/material.dart';
import 'package:pattern/behavioral/visitor/visitor.dart';

import 'file.dart';

class TextFile extends File {
  const TextFile({
    required this.content,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.description);

  final String content;

  @override
  String accept(IVisitor visitor) => visitor.visitTextFile(this);
}
