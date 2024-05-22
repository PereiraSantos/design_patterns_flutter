import 'package:pattern/creational/builder/usercases/burger.dart';
import 'package:pattern/creational/builder/usercases/burger_builder_base.dart';

class BurgerMake {
  BurgerMake(this.burgerBuilderBase);

  BurgerBuilderBase burgerBuilderBase;

  void changeBurgerBuilder(BurgerBuilderBase burgerBuilderBase) {
    this.burgerBuilderBase = burgerBuilderBase;
  }

  Burger getBurger() => burgerBuilderBase.getBurger();

  void prepareBurger() {
    burgerBuilderBase.createBurger();
    burgerBuilderBase.setBurgerPrice();

    burgerBuilderBase.addBuns();
    burgerBuilderBase.addCheese();
    burgerBuilderBase.addPatties();
    burgerBuilderBase.addSauces();
    burgerBuilderBase.addSeasoning();
    burgerBuilderBase.addVegetables();
  }
}
