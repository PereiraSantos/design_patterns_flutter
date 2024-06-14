import 'package:pattern/dashboard/usercases/partner.dart';

class Adapter implements Partner {
  const Adapter();

  @override
  String description() =>
      'O Adapter é um padrão de projeto estrutural que permite objetos com interfaces incompatíveis colaborarem entre si.';

  @override
  String title() => 'Adpter';
}
