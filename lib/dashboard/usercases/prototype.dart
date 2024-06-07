import 'package:pattern/dashboard/usercases/partner.dart';

class Prototype implements Partner {
  const Prototype();

  @override
  String description() =>
      'Especifique os tipos de objetos a serem criados usando uma instância prototípica e crie novos objetos copiando este protótipo';

  @override
  String title() => 'Prototype';
}
