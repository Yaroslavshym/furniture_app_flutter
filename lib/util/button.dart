import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String myButtonText;
  final double buttonPaddingHorizontal;
  final double buttonPaddingVertical;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final void Function() onTap;
  const MyButton({
    super.key,
    required this.myButtonText,
    required this.onTap,
    required this.buttonPaddingHorizontal,
    required this.buttonPaddingVertical,
    required this.fontSize,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          // shape: BoxShape.circle,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: buttonPaddingHorizontal,
          vertical: buttonPaddingVertical,
        ),
        child: Center(
          child: Text(
            myButtonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: textColor,
              backgroundColor: Colors.transparent,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
