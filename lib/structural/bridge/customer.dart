import 'package:pattern/structural/bridge/entity_base.dart';
import 'package:pattern/structural/bridge/fake.dart';

class Customer extends EntityBase {
  Customer()
      : name = random(),
        email = random();

  final String name;
  final String email;

  Customer.fromJson(super.json)
      : name = json['name'] as String,
        email = json['email'] as String,
        super.fromJson();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
