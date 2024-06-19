import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/pages/login_card.dart';
import 'package:furniture_app_flutter/pages/singup_card.dart';
import 'package:furniture_app_flutter/util/button.dart';
import 'package:furniture_app_flutter/util/intro_providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Duration _animationDuration = const Duration(milliseconds: 1200);
    var introProviderListen = Provider.of<IntroPageProviderData>(context);
    Size mediaQuerySize = MediaQuery.of(context).size;
    bool showElements = introProviderListen.showElements;
    // Text 'Welcome'
    Widget getTextWidget1(bool isVisible) {
      return Text(
        'Welcome',
        textAlign: TextAlign.start,
        style: GoogleFonts.manrope(
          color: isVisible ? Colors.black : Colors.transparent,
          fontWeight: FontWeight.w900,
          fontSize: mediaQuerySize.width * 0.1,
        ),
      );
    }

    // Text "Let's make your own home unique and comfortable"
    Widget getTextWidget2(bool isVisible) {
      return Text(
        "Let's make your own home unique and \ncomfortable",
        textAlign: TextAlign.start,
        style: GoogleFonts.manrope(
          color: isVisible ? Colors.black : Colors.transparent,
          backgroundColor: Colors.transparent,
          fontWeight: FontWeight.w400,
          fontSize: mediaQuerySize.width * 0.05,
        ),
      );
    }

    Widget getButtonWidget(bool isVisible) {
      return MyButton(
        backgroundColor: isVisible ? Colors.black : Colors.transparent,
        textColor: isVisible ? Colors.white : Colors.transparent,
        buttonPaddingHorizontal: mediaQuerySize.width * 0.1,
        buttonPaddingVertical: mediaQuerySize.height * 0.02,
        fontSize: mediaQuerySize.width * 0.07,
        onTap: () {
          setState(() {
            Provider.of<IntroPageProviderData>(context, listen: false)
                .showBlur = true;
            Provider.of<IntroPageProviderData>(context, listen: false)
                .showElements = false;
            Future.delayed(const Duration(milliseconds: 1500)).then((value) {
              setState(() {
                Provider.of<IntroPageProviderData>(context, listen: false)
                    .showCard = true;
              });
            });
          });
        },
        myButtonText: 'Get Started',
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // background image
          Positioned(
            top: 0,
            child: Container(
              width: mediaQuerySize.width,
              height: mediaQuerySize.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/intro_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Disapearing text on image
          Positioned(
            top: mediaQuerySize.height * 0.1,
            left: mediaQuerySize.width * 0.05,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                  firstChild: getTextWidget1(true),
                  secondChild: getTextWidget1(false),
                  crossFadeState: showElements
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: _animationDuration,
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.007,
                ),
                AnimatedCrossFade(
                  firstChild: getTextWidget2(true),
                  secondChild: getTextWidget2(false),
                  crossFadeState: showElements
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: _animationDuration + _animationDuration * 0.20,
                ),
              ],
            ),
          ),

          // button get started
          Positioned(
            // duration: _animationDuration - _animationDuration * 0.25,
            bottom: mediaQuerySize.height * 0.03,
            left: mediaQuerySize.width * 0.05,
            child: SizedBox(
              width: mediaQuerySize.width * 0.9,
              child: AnimatedCrossFade(
                firstChild: getButtonWidget(true),
                secondChild: getButtonWidget(false),
                crossFadeState: showElements
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: _animationDuration + _animationDuration * 0.20,
              ),
            ),
          ),

          // go back by clicking outside of box
          Positioned(
              top: 0,
              child: introProviderListen.showBlur
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .showElements = true;
                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .showCard = false;
                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .showBlur = false;
                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .isLogInState = !introProviderListen.isLogInState;

                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .nameController
                              .text = '';
                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .emailController
                              .text = '';
                          Provider.of<IntroPageProviderData>(context,
                                  listen: false)
                              .passwordController
                              .text = '';
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        width: mediaQuerySize.width,
                        height: mediaQuerySize.height,
                      ),
                    )
                  : const SizedBox()),

          // Sing up page
          AnimatedPositioned(
            duration: _animationDuration,
            curve: Curves.decelerate,
            top: mediaQuerySize.height *
                (introProviderListen.showCard ? 0.25 : 1),
            left: 0,
            child: AnimatedCrossFade(
              firstChild: LogInCard(),
              secondChild: const SingUpCard(),
              crossFadeState: introProviderListen.isLogInState
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: _animationDuration + _animationDuration * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
