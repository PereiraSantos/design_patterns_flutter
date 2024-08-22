import 'package:pattern/structural/bridge/fake.dart';

abstract class EntityBase {
  EntityBase() : id = random();

  final String id;

  EntityBase.fromJson(Map<String, dynamic> json) : id = json['id'] as String;
}
