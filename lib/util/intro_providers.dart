import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/pages/login_card.dart';
import 'package:furniture_app_flutter/pages/singup_card.dart';

final introCards = [const SingUpCard(), LogInCard()];

class IntroPageProviderData extends ChangeNotifier {
  // Sing up / Log in variables

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Managing Login/Singup state in intro page

  bool showElements = true;
  bool showBlur = false;
  bool showCard = false;
  bool isLogInState = true;

  void changeCard() {
    isLogInState = !isLogInState;
    onLeave();
    notifyListeners();
  }

  void onLeave() {
    nameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    notifyListeners();
  }
}
