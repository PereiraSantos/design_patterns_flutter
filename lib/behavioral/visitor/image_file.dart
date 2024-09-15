import 'package:flutter/material.dart';
import 'package:pattern/behavioral/visitor/visitor.dart';

import 'file.dart';

class ImageFile extends File {
  const ImageFile({
    required this.resolution,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.image);

  final String resolution;

  @override
  String accept(IVisitor visitor) => visitor.visitImageFile(this);
}
