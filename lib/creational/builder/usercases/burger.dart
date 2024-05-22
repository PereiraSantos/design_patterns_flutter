import 'package:pattern/creational/builder/usercases/ingredient.dart';

class Burger {
  final List<Ingredient> _ingredients = [];
  late double _price;

  void addIngredient(Ingredient ingredient) => _ingredients.add(ingredient);

  String getFormattedIngredients() => _ingredients.map((e) => e.getName()).join(', ');

  String getFormatterAllergens() => <String>{
        for (final ingredient in _ingredients) ...ingredient.getAllergens(),
      }.join(', ');

  String getFormattedPrice() => '\$${_price.toStringAsFixed(2)}';

  void setPrice(double price) => _price = price;
}
