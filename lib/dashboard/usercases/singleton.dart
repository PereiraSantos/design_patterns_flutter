import 'package:pattern/dashboard/usercases/partner.dart';

class Singleton implements Partner {
  const Singleton();

  @override
  String description() =>
      'Permite a você garantir que uma classe tenha apenas uma instância, enquanto provê um ponto de acesso global para essa instância.';

  @override
  String title() => 'Singleton';
}
