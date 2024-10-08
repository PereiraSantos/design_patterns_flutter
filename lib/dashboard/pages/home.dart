import 'package:flutter/material.dart';
import 'package:pattern/dashboard/componet/card_custom.dart';
import 'package:pattern/dashboard/componet/description.dart';
import 'package:pattern/dashboard/componet/text_custom.dart';
import 'package:pattern/dashboard/usercases/adapter.dart';
import 'package:pattern/dashboard/usercases/abstract_factory.dart';
import 'package:pattern/dashboard/usercases/builder.dart';
import 'package:pattern/dashboard/usercases/composite.dart';
import 'package:pattern/dashboard/usercases/factory_method.dart';
import 'package:pattern/dashboard/usercases/prototype.dart';
import 'package:pattern/dashboard/usercases/singleton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partner"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: CardCustom(
                child: [
                  const Center(child: TextCustom(label: 'Criacional')),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/abstract'),
                      child: TextCustom(label: const AbstractFactory().title())),
                  Description(label: const AbstractFactory().description()),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/builder'),
                      child: TextCustom(label: const BuilderImp().title())),
                  Description(label: const BuilderImp().description()),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/factory'),
                      child: TextCustom(label: const FactoryMethod().title())),
                  Description(label: const FactoryMethod().description()),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/prototype'),
                      child: TextCustom(label: const Prototype().title())),
                  Description(label: const Prototype().description()),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/singleton'),
                      child: TextCustom(label: const Singleton().title())),
                  Description(label: const Singleton().description())
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: CardCustom(
                child: [
                  const Center(child: TextCustom(label: 'Estrutural')),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/adapter'),
                      child: TextCustom(label: const Adapter().title())),
                  Description(label: const Adapter().description()),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/composite'),
                      child: TextCustom(label: const Composite().title())),
                  Description(label: const Composite().description()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
