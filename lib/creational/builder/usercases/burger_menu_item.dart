import 'package:pattern/creational/builder/usercases/burger_builder_base.dart';

class BurgerMenuItem {
  String label;
  BurgerBuilderBase burgerBuilderBase;

  BurgerMenuItem({required this.label, required this.burgerBuilderBase});
}
