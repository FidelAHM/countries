import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AppColors {
  static Color gray600 = fromHex('#818181');
  static Color greenIcon = fromHex("#00A2AE");
  static Color gray700 = fromHex('#666666');

  static Color gray400 = fromHex('#c4c4c4');

  static Color gray500 = fromHex('#ababab');

  static Color lightBlue90001 = fromHex('#0761a4');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color indigo50 = fromHex('#e5eef8');

  static Color gray900 = fromHex('#1b1b1b');

  static Color blue80063 = fromHex('#630055b8');

  static Color yellowA700 = fromHex('#ffce03');

  static Color black9003f = fromHex('#3f000000');

  static Color lightBlue900 = fromHex('#025aa2');
  static Color merhaba = fromHex('#00A2AEFF');

  static Color gray50 = fromHex('#f8f8f8');

  static Color gray100 = fromHex('#f3f3f3');

  static Color lightBlue9007f = fromHex('#7f025aa2');

  static Color gray6007f = fromHex('#7f818181');

  static Color amberA40000 = fromHex('#00ffcd02');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color indigo5087 = fromHex('#87e5eef8');

  static Color blueGray900 = fromHex('#2d2b2e');

  static Color whiteA700 = fromHex('#ffffff');
  static Color yellow100 = fromHex('#FFCE03');
  static Color blueForBack = fromHex("#025AA2");
  static Color lightGreen = fromHex("#00A2AE");
  static Color lightGrey = Colors.grey.shade100;
  static Color lightBlue = fromHex("EFF8FF");
  static Color lightBlue100 = Colors.lightBlue.shade100;
  static Color lightBlue50 = Colors.lightBlue.shade50;
  static Color lightBlue300 = Colors.lightBlue.shade300;
  static Color green = Colors.green;
  static Color lightGreenish = const Color.fromARGB(255, 212, 244, 213);
  static Color red = Colors.red;

  static Color lemonGreen = fromHex("#86C144");
  static Color darkGreen = Color.fromARGB(255, 23, 66, 24);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}