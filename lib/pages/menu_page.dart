import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/util/bottom_navigation_bar.dart';
import 'package:furniture_app_flutter/util/button.dart';
import 'package:furniture_app_flutter/util/icon_button.dart';
import 'package:furniture_app_flutter/util/product_box.dart';
import 'package:furniture_app_flutter/util/text_form.dart';

import '../classes/Furniture.dart';
import '../storage/cloud_management.dart';

List<String> cathegoryList = [
  'Popular',
  'Sofa',
  'Bed',
  'Chair',
  'Table',
  'Weer',
];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // start animation
  // Used to get list of Widget with furniture

  // Initial selected index
  void sendToProductDescriptionPage(Furniture product) {
    Navigator.pushNamed(
      context,
      '/ProductDescriptionPage',
      arguments: {'product': product},
    );
  }

  List<Widget> getBoxes(var data, Size mediaQuerySize) {
    List<Widget> ans = [];
    for (var dict in data[0]) {
      ans.add(
        GestureDetector(
          onTap: () => sendToProductDescriptionPage(dict),
          child: Padding(
            padding: EdgeInsets.only(bottom: mediaQuerySize.width * 0.1),
            child: ProductBox(product: dict),
          ),
        ),
      );
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuerySize.height * 0.1),
        child: AppBar(
          scrolledUnderElevation: 0,
          foregroundColor: const Color.fromRGBO(247, 247, 247, 1),
          surfaceTintColor: const Color.fromRGBO(247, 247, 247, 1),
          shadowColor: const Color.fromRGBO(247, 247, 247, 1),
          backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // menu button
              Padding(
                padding: EdgeInsets.only(
                  left: mediaQuerySize.width * 0.05,
                  // top: mediaQuerySize.width * 0.05,
                ),
                child: const MyIconButton(
                  buttonWidth: 50,
                  buttonHeight: 50,
                  buttonIcon: Icons.menu,
                  buttonBorderRadius: 10,
                ),
              ),
              // notification button
              Padding(
                padding: EdgeInsets.only(
                  right: mediaQuerySize.width * 0.05,
                  // top: mediaQuerySize.width * 0.05,
                ),
                child: const MyIconButton(
                  buttonWidth: 50,
                  buttonHeight: 50,
                  buttonIcon: Icons.notifications_outlined,
                  buttonBorderRadius: 10,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mediaQuerySize.width * 0.05,
          vertical: mediaQuerySize.height * 0.02,
        ),
        child: ListView(
          children: [
            MyTextForm(
              iconData1: Icons.search,
              iconData2: Icons.qr_code_scanner_rounded,
              iconButtonOnTap1: () {},
              iconButtonOnTap2: () {},
              textEditingController: TextEditingController(),
              infoText: 'Search for furniture',
            ),
            SizedBox(height: mediaQuerySize.height * 0.025),
            SizedBox(
              height: mediaQuerySize.height * 0.025,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cathegoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: mediaQuerySize.width * 0.05),
                    child: SizedBox(
                      width: mediaQuerySize.width * 0.2,
                      child: MyButton(
                        myButtonText: cathegoryList[index],
                        onTap: () {},
                        buttonPaddingHorizontal: 0,
                        buttonPaddingVertical: 0,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: mediaQuerySize.height * 0.05),
            FutureBuilder(
              future: Future.wait([getData(), getDatabaseLength()]),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                var data = snapshot.data;
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (data != null) {
                  return Column(children: getBoxes(data, mediaQuerySize));
                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(height: mediaQuerySize.height * 0.2),
          ],
        ),

        /* multi-task bottom navigation bar main tasks:
          *
          * mode 3 - Price && Add to cart button
          * mode 2 - Title && Description && Rating
          * mode 1 - MAIN: bottom navigation bar for main page of menu
          *
          */

        // Consumer<MenuPageProviderData>(builder: (context, myModel, child) {})

        // animatedPositionedNavBarsList[0],
        // animatedPositionedNavBarsList[1],
        // animatedPositionedNavBarsList[2],
      ),
    );
  }
}

// [
// BottomNavigationBarItem(icon: Icon(Icons.home)           , label: 'Home'),
// BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)  , label: 'Cart'),
// BottomNavigationBarItem(icon: Icon(Icons.chat)           , label: 'Chat'),
// BottomNavigationBarItem(icon: Icon(Icons.category)       , label: 'Catalog'),
// BottomNavigationBarItem(icon: Icon(Icons.account_circle) , label: 'Account'),
// ],
