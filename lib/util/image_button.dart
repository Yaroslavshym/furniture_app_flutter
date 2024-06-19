import 'package:flutter/material.dart';

class MyImageButton extends StatelessWidget {
  final String imagePath;
  final double buttonWidth;
  final double buttonHeight;
  final Color backgroundColor;

  final double imageScale;
  const MyImageButton({
    super.key,
    this.backgroundColor = Colors.black,
    required this.imagePath,
    required this.imageScale,
    required this.buttonWidth,
    required this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        scale: imageScale,
      ),
    );
  }
}
