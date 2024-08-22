import 'package:pattern/structural/decorator/pizza.dart';
import 'package:pattern/structural/decorator/pizza_topping_data.dart';

class PizzaMenu {
  final Map<int, PizzaToppingData> _pizzaToppingDataMap = {
    1: PizzaToppingData('Brasil'),
    2: PizzaToppingData('Mozzarella'),
    3: PizzaToppingData('Olive Oil'),
    4: PizzaToppingData('Oregano'),
    5: PizzaToppingData('Pecorino'),
    6: PizzaToppingData('Pepperini'),
    7: PizzaToppingData('sauce'),
  };

  Map<int, PizzaToppingData> getPizzaTopingDatamap() => _pizzaToppingDataMap;

  Pizza getPizza(int index, Map<int, PizzaToppingData> pizzaToppingDataMap) => switch (index) {
        0 => _getMargherita(),
        1 => _getPepperoni(),
        2 => _getCustom(pizzaToppingDataMap),
        _ => throw Exception('index of $index does not exist')
      };

  Pizza _getPepperoni() {
    Pizza pizza = const PizzaBase('Pizza pepperoni');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Oregano(pizza);
    pizza = Pecorino(pizza);

    return pizza;
  }

  Pizza _getMargherita() {
    Pizza pizza = const PizzaBase('Pizza Margherita');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Brasil(pizza);
    pizza = Oregano(pizza);
    pizza = Pecorino(pizza);
    pizza = OliveOil(pizza);

    return pizza;
  }

  Pizza _getCustom(Map<int, PizzaToppingData> pizzaToppingDataMap) {
    Pizza pizza = const PizzaBase('Custom Pizza');

    if (pizzaToppingDataMap[1]!.selected) pizza = Brasil(pizza);
    if (pizzaToppingDataMap[2]!.selected) pizza = Mozzarella(pizza);
    if (pizzaToppingDataMap[3]!.selected) pizza = OliveOil(pizza);
    if (pizzaToppingDataMap[4]!.selected) pizza = Oregano(pizza);
    if (pizzaToppingDataMap[5]!.selected) pizza = Pecorino(pizza);
    if (pizzaToppingDataMap[6]!.selected) pizza = Pepperoni(pizza);
    if (pizzaToppingDataMap[7]!.selected) pizza = Sauce(pizza);

    return pizza;
  }
}
