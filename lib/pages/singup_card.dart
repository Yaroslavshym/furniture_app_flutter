import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/util/button.dart';
import 'package:furniture_app_flutter/util/image_button.dart';
import 'package:furniture_app_flutter/util/intro_providers.dart';
import 'package:furniture_app_flutter/util/text_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingUpCard extends StatefulWidget {
  const SingUpCard({
    super.key,
  });

  @override
  State<SingUpCard> createState() => _SingUpCardState();
}

class _SingUpCardState extends State<SingUpCard> {
  @override
  Widget build(BuildContext context) {
    var introProviderListen = Provider.of<IntroPageProviderData>(context);
    Size mediaQuerySize = MediaQuery.of(context).size;
    void Function() changeCard =
        Provider.of<IntroPageProviderData>(context, listen: false).changeCard;

    bool showBlur = introProviderListen.showBlur;
    TextEditingController _nameController = introProviderListen.nameController;
    TextEditingController _emailController =
        introProviderListen.emailController;
    TextEditingController _passwordController =
        introProviderListen.passwordController;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: showBlur ? 10 : 0,
        sigmaY: showBlur ? 10 : 0,
      ),
      child: Container(
        width: mediaQuerySize.width,
        height: mediaQuerySize.height * 0.75,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Color.fromARGB(200, 227, 227, 227),
        ),
        child: Column(
          children: [
            SizedBox(height: mediaQuerySize.height * 0.03),
            Text(
              'Create account',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                color: const Color.fromARGB(255, 0, 0, 0),
                backgroundColor: Colors.transparent,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05),
              child: Column(
                children: [
                  SizedBox(height: mediaQuerySize.height * 0.035),
                  MyTextForm(
                    iconData1: Icons.person_outlined,
                    textEditingController: _nameController,
                    infoText: 'Name',
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.025),
                  MyTextForm(
                    iconData1: Icons.email_outlined,
                    textEditingController: _emailController,
                    infoText: 'Email',
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.025),
                  MyTextForm(
                    iconData1: Icons.lock_outline,
                    textEditingController: _passwordController,
                    infoText: 'Password',
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.025),
                  MyButton(
                    myButtonText: 'Sing up',
                    onTap: () {},
                    buttonPaddingHorizontal: mediaQuerySize.width * 0.3,
                    buttonPaddingVertical: mediaQuerySize.height * 0.015,
                    fontSize: 17,
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.05),
                  Text(
                    "Or continue with",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyImageButton(
                        imagePath: 'lib/images/icons/twitter_icon.png',
                        imageScale: 2,
                        buttonHeight: 45,
                        buttonWidth: 45,
                      ),
                      SizedBox(width: mediaQuerySize.width * 0.05),
                      const MyImageButton(
                        imagePath: 'lib/images/icons/facebook_icon.png',
                        imageScale: 2.5,
                        buttonHeight: 45,
                        buttonWidth: 45,
                      ),
                      SizedBox(width: mediaQuerySize.width * 0.05),
                      const MyImageButton(
                        imagePath: 'lib/images/icons/instagram_icon.png',
                        imageScale: 1.4,
                        buttonHeight: 45,
                        buttonWidth: 45,
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text and underline
                      GestureDetector(
                        onTap: () {
                          changeCard();
                        },
                        child: SizedBox(
                          width: mediaQuerySize.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Already have account?",
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              // SizedBox(
                              //     height:
                              //         mediaQuerySize.height * 0.0),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // SizedBox(width: mediaQuerySize.width * 0.0001),
                      // other text
                      Text(
                        "Login",
                        style: GoogleFonts.manrope(
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
