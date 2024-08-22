import 'package:flutter/material.dart';
import 'package:pattern/structural/decorator/pizza.dart';
import 'package:pattern/structural/decorator/pizza_menu.dart';

import 'package:pattern/structural/decorator/pizza_topping_data.dart';

class DecoratorPage extends StatefulWidget {
  const DecoratorPage({super.key});

  @override
  State<DecoratorPage> createState() => _DecoratorPageState();
}

class _DecoratorPageState extends State<DecoratorPage> {
  final PizzaMenu pizzaMenu = PizzaMenu();

  late final Map<int, PizzaToppingData> _pizzaToppingDataMap;
  late Pizza _pizza;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pizzaToppingDataMap = pizzaMenu.getPizzaTopingDatamap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingDataMap);
  }

  void _setSelectIndexChange(int? index) {
    _setSelectIndex(index!);
    _setSelectedPizza(index);
  }

  void _setSelectIndex(int index) => setState(() {
        _selectedIndex = index;
      });

  void _onCustomPizzaChipSelected(int index, bool? selected) {
    _setChipSelected(index, selected!);
    _setSelectedPizza(index);
  }

  void _setChipSelected(int index, bool selected) => setState(() {
        _pizzaToppingDataMap[index]!.setSelect(isSelect: selected);
      });

  void _setSelectedPizza(int index) {
    _pizza = pizzaMenu.getPizza(index, _pizzaToppingDataMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
