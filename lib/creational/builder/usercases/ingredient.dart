import 'package:flutter/material.dart';

abstract class Ingredient {
  @protected
  late List<String> allergens;

  @protected
  late String name;

  List<String> getAllergens() => allergens;

  String getName() => name;
}

class BigMacBun extends Ingredient {
  BigMacBun() {
    name = 'Big Mac Bun';
    allergens = ['Wheat'];
  }
}

class RegularBun extends Ingredient {
  RegularBun() {
    name = 'Regular Bun';
    allergens = ['Wheat'];
  }
}

class BeefPatty extends Ingredient {
  BeefPatty() {
    name = 'Beff Patty';
    allergens = [];
  }
}

class McChickinPatty extends Ingredient {
  McChickinPatty() {
    name = 'McChicken Patty';
    allergens = ['Wheat', 'Cooked in the same fryer that we use for Buttermilk'];
  }
}

class BigMacSauce extends Ingredient {
  BigMacSauce() {
    name = 'Big Mac Sauce';
    allergens = ['Egg', 'Sony', 'Wheat'];
  }
}

class KetChup extends Ingredient {
  KetChup() {
    name = 'Ketchup';
    allergens = [];
  }
}

class Mayonnaise extends Ingredient {
  Mayonnaise() {
    name = 'Mayonnaise';
    allergens = ['Egg'];
  }
}

class Mustard extends Ingredient {
  Mustard() {
    name = 'Mustard';
    allergens = [];
  }
}

class Onions extends Ingredient {
  Onions() {
    name = 'Onins';
    allergens = [];
  }
}

class PickleSlices extends Ingredient {
  PickleSlices() {
    name = 'Pickle Slices';
    allergens = [];
  }
}

class ShreddedLettuce extends Ingredient {
  ShreddedLettuce() {
    name = 'Shreded Lettuce';
    allergens = [];
  }
}

class Cheese extends Ingredient {
  Cheese() {
    name = 'Cheese';
    allergens = ['Milk', 'Sory'];
  }
}

class GrillSeasoning extends Ingredient {
  GrillSeasoning() {
    name = 'GrillSeasoning';
    allergens = [];
  }
}
