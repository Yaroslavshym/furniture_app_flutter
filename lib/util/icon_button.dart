import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final IconData buttonIcon;
  final double buttonBorderRadius;

  const MyIconButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonIcon,
    this.buttonBorderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          buttonIcon,
          color: Colors.black,
        ),
      ),
    );
  }
}
