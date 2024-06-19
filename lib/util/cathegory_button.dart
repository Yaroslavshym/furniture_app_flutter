import 'package:flutter/material.dart';

class CathegoryButton extends StatelessWidget {
  final String text;
  const CathegoryButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
