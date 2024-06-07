import 'package:pattern/dashboard/usercases/partner.dart';

class BuilderImp implements Partner {
  const BuilderImp();
  @override
  String description() =>
      'Separar a construção de um objeto complexo de sua representação para que o mesmo processo de construção possa criar representações diferentes ';

  @override
  String title() => 'Builder';
}
