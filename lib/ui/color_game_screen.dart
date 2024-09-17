import 'package:flutter/material.dart';

import '../controller/color_controller.dart';
import 'custom_text.dart';

class ColorGameScreen extends StatefulWidget {
  const ColorGameScreen({super.key});

  @override
  State<ColorGameScreen> createState() => _ColorGameScreenState();
}

class _ColorGameScreenState extends State<ColorGameScreen> {
  late final ColorController controller;

  @override
  void initState() {
    super.initState();
    controller = ColorController();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.currentColor,
      builder: (_, currentColor, __) {
        bool isColorBlack = currentColor == Colors.black;
        bool isColorWhite = currentColor == Colors.white;

        return Material(
          color: currentColor,
          child: GestureDetector(
            onTap: () => controller.currentColor.value = controller.generateColor(),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "Hello there",
                        color: isColorBlack ? Colors.white : Colors.black,
                      ),
                      CustomText(
                        "Tap me!!",
                        fontSize: 15,
                        color: isColorBlack ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ElevatedButton(
                    child: CustomText(
                      "Don't tap me :)",
                      fontSize: 20,
                      color: isColorWhite ? Colors.black : currentColor,
                    ),
                    onPressed: () => controller.startColorShuffle(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
