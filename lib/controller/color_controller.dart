import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ColorController {
  final ValueNotifier<Color> currentColor = ValueNotifier<Color>(Colors.pink);
  final Random _random = Random();
  final int _shuffleCount = 35;
  Timer? _timer;

  Color generateColor() {
    int red = _random.nextInt(256);
    int green = _random.nextInt(256);
    int blue = _random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }

  void startColorShuffle() {
    stopColorShuffle();

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      currentColor.value = generateColor();
      if (timer.tick == _shuffleCount) stopColorShuffle();
    });
  }

  void stopColorShuffle() => _timer?.cancel();
}
