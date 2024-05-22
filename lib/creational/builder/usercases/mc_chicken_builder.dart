import 'package:pattern/creational/builder/usercases/burger_builder_base.dart';
import 'package:pattern/creational/builder/usercases/ingredient.dart';

class McChickenBuilder extends BurgerBuilderBase {
  McChickenBuilder() {
    price = 1.29;
  }

  @override
  void addBuns() {
    burger.addIngredient(RegularBun());
  }

  @override
  void addCheese() {
    // not needed
  }

  @override
  void addPatties() {
    burger.addIngredient(McChickinPatty());
  }

  @override
  void addSauces() {
    burger.addIngredient(Mayonnaise());
  }

  @override
  void addSeasoning() {
    // nit needed
  }

  @override
  void addVegetables() {
    burger.addIngredient(ShreddedLettuce());
  }
}
