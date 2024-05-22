import 'package:pattern/dashboard/usercases/partner.dart';

class Prototype extends Partner {
  Prototype();

  @override
  String description() => 'Especifique os tipos de objetos a serem criados usando uma instância prototípica e crie novos objetos copiando este protótipo';

  @override
  String title() => 'Prototype';
}
