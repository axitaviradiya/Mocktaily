import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'menu.dart';
import 'profile.dart';
import 'cart.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _SelectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MainHome(),
    MenuPage(),

     ProfilePage(),
    Cart(),

  ];
  void _onIteamTapped(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions[_SelectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 24, 28, 76),
          color: Colors.white,
          animationDuration: Duration(milliseconds: 400),
          // currentIndex: _SelectedIndex,
          onTap: _onIteamTapped,
          // selectedItemColor: Color.fromARGB(255, 230, 155, 155),
          // unselectedItemColor: Color.fromARGB(255, 226, 114, 152),
          items: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.menu,
              size: 30,
            ),
            Icon(
              Icons.account_circle_sharp,
              size: 30,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ],
        ));
  }
}
