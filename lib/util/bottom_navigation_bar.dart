import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/util/menu_provider.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        Provider.of<MenuPageProviderData>(context).selectedIndex;
    void selectItem(int index) {
      setState(() {
        Provider.of<MenuPageProviderData>(context, listen: false)
            .selectedIndex = index;
      });
    }

    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: mediaQuerySize.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                selectItem(0);
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                selectItem(1);
              }),
          IconButton(
              icon: Icon(
                Icons.chat,
                color: selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                selectItem(2);
              }),
          IconButton(
              icon: Icon(
                Icons.category,
                color: selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                selectItem(3);
              }),
          IconButton(
              icon: Icon(
                Icons.account_circle,
                color: selectedIndex == 4 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                selectItem(4);
              }),
        ],
      ),
    );
  }
}
