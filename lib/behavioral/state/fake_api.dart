import 'dart:math';

class FakeApi {
  const FakeApi();

  Future<List<String>> getNames() => Future.delayed(
        const Duration(seconds: 2),
        () {
          if (Random().nextBool()) return _getRandomNames();

          throw Exception('Unexpected error');
        },
      );

  List<String> _getRandomNames() => List.generate(
        Random().nextBool() ? 3 : 0,
        (_) => (Random().nextInt(150) + 0).toString(),
      );
}
