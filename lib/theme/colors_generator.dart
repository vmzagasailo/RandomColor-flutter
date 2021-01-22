import 'package:flutter/material.dart';

import 'dart:math';

mixin ColorsGenerator {
  Random _random = Random();
  
  Color get randomColor {
    return Color.fromRGBO(_random.nextInt(256), _random.nextInt(256),
        _random.nextInt(256), 1);
  }
}
