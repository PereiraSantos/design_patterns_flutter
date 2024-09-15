import 'package:flutter/material.dart';
import 'package:pattern/behavioral/visitor/visitor.dart';

import 'file.dart';

class VideoFile extends File {
  const VideoFile({
    required this.directedBy,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.movie);

  final String directedBy;

  @override
  String accept(IVisitor visitor) => visitor.visitVideoFile(this);
}
