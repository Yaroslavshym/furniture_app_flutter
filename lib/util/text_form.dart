import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextForm extends StatelessWidget {
  final String infoText;
  final TextEditingController textEditingController;
  final IconData? iconData1;
  final IconData? iconData2;
  final void Function()? iconButtonOnTap1;
  final void Function()? iconButtonOnTap2;
  const MyTextForm({
    super.key,
    this.iconData1 = null,
    this.iconData2 = null,
    this.infoText = '',
    required this.textEditingController,
    this.iconButtonOnTap1 = null,
    this.iconButtonOnTap2 = null,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Focus the text field when the container is tapped
        // FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.002,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: iconButtonOnTap1,
              child: Icon(
                iconData1,
                // Icons.person_2_outlined,
                size: MediaQuery.of(context).size.height * 0.024,
                color: Colors.black,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Expanded(
              child: TextFormField(
                controller: textEditingController,
                maxLength: 30,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: infoText,
                  // labelText: infoText,
                  hintStyle: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  // labelStyle:
                  border: InputBorder.none, // Remove the underline
                ),
                cursorColor: Colors.black,
                clipBehavior: Clip.none,
              ),
            ),
            iconButtonOnTap2 != null && iconData2 != null
                ? GestureDetector(
                    onTap: iconButtonOnTap2,
                    child: Icon(
                      iconData2,
                      // Icons.person_2_outlined,
                      size: MediaQuery.of(context).size.height * 0.024,
                      color: Colors.black,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
