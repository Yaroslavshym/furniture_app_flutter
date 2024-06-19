import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAddToCart extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const ButtonAddToCart({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: mediaQuerySize.height * 0.009,
          horizontal: mediaQuerySize.width * 0.025,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: mediaQuerySize.width * 0.035,
          ),
        ),
      ),
    );
  }
}
