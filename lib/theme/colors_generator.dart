import 'package:flutter/material.dart';

import 'dart:math';

mixin ColorsGenerator {
  final Random _random = Random();

  Color get randomColor {
    return Color.fromRGBO(
        _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1);
  }
}
