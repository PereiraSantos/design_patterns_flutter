import 'package:flutter/material.dart';
import 'package:pattern/creational/abstract_factory/page/abstract_factor_page.dart';
import 'package:pattern/creational/builder/page/builder_exmple.dart';
import 'package:pattern/creational/factory_method/page/factory_method_exemple.dart';
import 'package:pattern/creational/prototype/page/protoype_exemple.dart';
import 'package:pattern/creational/singleton/page/singleton_exemple.dart';
import 'package:pattern/dashboard/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          background: Colors.white,
          onPrimary: Colors.red,
          onTertiary: Colors.orange,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        '/abstract': (context) => const AbstractFactoryPage(),
        '/builder': (context) => const BuilderExemple(),
        '/factory': (context) => const FactoryMethodExemple(),
        '/prototype': (context) => const PrototypeExemple(),
        '/singleton': (context) => const SingletonExemple(),
      },
    );
  }
}
