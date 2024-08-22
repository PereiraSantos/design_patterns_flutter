import 'package:pattern/dashboard/usercases/partner.dart';

class Composite implements Partner {
  const Composite();

  @override
  String description() =>
      'É um padrão de projeto estrutural que permite compor objetos em estruturas de árvore e depois trabalhar com essas estruturas como se fossem objetos individuais.';

  @override
  String title() => 'Composite';
}
