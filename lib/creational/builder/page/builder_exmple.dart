import 'package:flutter/material.dart';
import 'package:pattern/creational/builder/usercases/big_mac_builder.dart';
import 'package:pattern/creational/builder/usercases/burger.dart';
import 'package:pattern/creational/builder/usercases/burger_maker.dart';
import 'package:pattern/creational/builder/usercases/burger_menu_item.dart';
import 'package:pattern/creational/builder/usercases/cheese_burger_builder.dart';
import 'package:pattern/creational/builder/usercases/hamburger_builder.dart';
import 'package:pattern/creational/builder/usercases/mc_chicken_builder.dart';

class BuilderExemple extends StatefulWidget {
  const BuilderExemple({super.key});

  @override
  State<BuilderExemple> createState() => _BuilderExempleState();
}

class _BuilderExempleState extends State<BuilderExemple> {
  final _builderMake = BurgerMake(HamburgerBuilder());
  final List<BurgerMenuItem> _burgerMenuItems = [];

  late BurgerMenuItem _selectBurgerMenuItem;
  late Burger _selectBurger;

  @override
  void initState() {
    super.initState();

    _burgerMenuItems.addAll([
      BurgerMenuItem(label: 'Hamburger', burgerBuilderBase: HamburgerBuilder()),
      BurgerMenuItem(label: 'Cheeseburger', burgerBuilderBase: CheeseburgerBuilder()),
      BurgerMenuItem(label: 'Big Mac\u00AE', burgerBuilderBase: BigMacBuilder()),
      BurgerMenuItem(label: 'McChicken\u00AE', burgerBuilderBase: McChickenBuilder())
    ]);

    _selectBurgerMenuItem = _burgerMenuItems[0];
    _selectBurger = _prepareSelectedBurger();
  }

  Burger _prepareSelectedBurger() {
    _builderMake.prepareBurger();

    return _builderMake.getBurger();
  }

  void _onBurgerMenuItemChange(BurgerMenuItem? selectItem) => setState(() {
        _selectBurgerMenuItem = selectItem!;
        _builderMake.changeBurgerBuilder(selectItem.burgerBuilderBase);
        _selectBurger = _prepareSelectedBurger();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selecione o item', style: Theme.of(context).textTheme.titleLarge),
              DropdownButton(
                  value: _selectBurgerMenuItem,
                  items: _burgerMenuItems
                      .map<DropdownMenuItem<BurgerMenuItem>>(
                        (BurgerMenuItem item) => DropdownMenuItem(
                          value: item,
                          child: Text(item.label),
                        ),
                      )
                      .toList(),
                  onChanged: _onBurgerMenuItemChange),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Informação", style: Theme.of(context).textTheme.titleMedium),
                  Text("Preço", style: Theme.of(context).textTheme.titleSmall),
                  Text(_selectBurger.getFormattedPrice()),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text('Ingredientes', style: Theme.of(context).textTheme.titleMedium),
                  Text(_selectBurger.getFormattedIngredients()),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text('Alérgicos', style: Theme.of(context).textTheme.titleMedium),
                  Text(_selectBurger.getFormatterAllergens()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
