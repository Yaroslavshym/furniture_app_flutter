import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/pages/intro_page.dart';
import 'package:furniture_app_flutter/pages/menu_page.dart';
import 'package:furniture_app_flutter/pages/product_description_page.dart';
import 'package:furniture_app_flutter/util/intro_providers.dart';
import 'package:furniture_app_flutter/util/menu_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  print('starting to packeges initialized');
  WidgetsFlutterBinding.ensureInitialized();
  print('packeges initialized');

  await Firebase.initializeApp(
      name: 'storage',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCcVAT4Ofj-s4sZjpfxaPu0edhFeNBb6Uo',
          appId: '1:559493696484:ios:f24f83d96047e0858115f1',
          messagingSenderId: '559493696484',
          projectId: 'furnitureapp-67db7',
          storageBucket: 'gs://furnitureapp-67db7.appspot.com'));
  await Firebase.initializeApp(
      name: 'database',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCcVAT4Ofj-s4sZjpfxaPu0edhFeNBb6Uo',
          appId: '1:559493696484:ios:f24f83d96047e0858115f1',
          messagingSenderId: '559493696484',
          projectId: 'furnitureapp-67db7',
          databaseURL:
              'https://furnitureapp-67db7-default-rtdb.europe-west1.firebasedatabase.app/'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IntroPageProviderData(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuPageProviderData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == '/IntroPage') {
            return MaterialPageRoute(
              builder: (context) => const IntroPage(),
            );
          } else if (settings.name == '/MenuPage') {
            return MaterialPageRoute(
              builder: (context) => const MenuPage(),
            );
          } else if (settings.name == '/ProductDescriptionPage') {
            final args = settings.arguments as Map<String, dynamic>;
            final product = args['product'];

            return MaterialPageRoute(
              builder: (context) => ProductDescriptionPage(product: product),
            );
          }

          return MaterialPageRoute(
            builder: (context) => const MenuPage(),
          );
        },
        initialRoute: '/MenuPage',
      ),
    );
  }
}
