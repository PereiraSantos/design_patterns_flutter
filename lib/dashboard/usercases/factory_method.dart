import 'package:pattern/dashboard/usercases/partner.dart';

class FactoryMethod implements Partner {
  const FactoryMethod();
  @override
  String description() =>
      'Defina uma interface para criar um objeto, mas deixe as subclasses decidirem qual classe instanciar. O método de fábrica permite que uma classe adie a instalação das subclasses';

  @override
  String title() => 'Factory Method';
}
