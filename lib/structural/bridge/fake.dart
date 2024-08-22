import 'dart:math';

String random() {
  String characters = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rndInt = Random();
  String valor = '';
  for (int i = 0; i < 10; i++) {
    valor += characters[rndInt.nextInt(characters.length)];
  }
  return valor;
}
