import 'package:pattern/dashboard/usercases/partner.dart';

class AbstractFactory implements Partner {
  const AbstractFactory();
  @override
  String description() =>
      'Fornece uma interface para criar famílias de objetos relacionados ou dependentes sem especificar suas classes concretas';

  @override
  String title() => 'Abstract Fatctoy';
}
