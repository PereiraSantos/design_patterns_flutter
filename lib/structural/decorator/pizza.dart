abstract interface class Pizza {
  String getDescription();
  double getPrice();
}

class PizzaBase implements Pizza {
  const PizzaBase(this.description);

  final String description;

  @override
  String getDescription() => description;

  @override
  double getPrice() => 3.0;
}

class PizzaDecorator implements Pizza {
  const PizzaDecorator(this.pizza);

  final Pizza pizza;

  @override
  String getDescription() => pizza.getDescription();

  @override
  double getPrice() => pizza.getPrice();
}

class Brasil extends PizzaDecorator {
  const Brasil(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()}\n-Brasil';

  @override
  double getPrice() => pizza.getPrice() + 0.2;
}

class Mozzarella extends PizzaDecorator {
  Mozzarella(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()} \n MOzzarella';

  @override
  double getPrice() => pizza.getPrice() + 0.5;
}

class Oregano extends PizzaDecorator {
  Oregano(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()} \n Oregano';

  @override
  double getPrice() => pizza.getPrice() + 0.2;
}

class Pecorino extends PizzaDecorator {
  Pecorino(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()} \n Pecorino';

  @override
  double getPrice() => pizza.getPrice() + 0.7;
}

class Pepperoni extends PizzaDecorator {
  Pepperoni(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()} \n Pepperoni';

  @override
  double getPrice() => pizza.getPrice() + 1.5;
}

class OliveOil extends PizzaDecorator {
  OliveOil(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()} \n OliveOil';

  @override
  double getPrice() => pizza.getPrice() + 1.1;
}

class Sauce extends PizzaDecorator {
  Sauce(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()} \n Sauce';

  @override
  double getPrice() => pizza.getPrice() + 1.3;
}
