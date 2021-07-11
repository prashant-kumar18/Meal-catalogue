import 'package:Meals/screens/drawer.dart';
import 'package:Meals/screens/meals_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'fav_screen.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Map<String, Object>> pages = [
    {
      'page': MealsCatogary(),
      'title': 'Categories',
    },
    {
      'page': Fav(),
      'title': 'Your Favorite',
    },
  ];
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Draweritem(),
      body: Container(
        color: Colors.grey,
        child: FlareActor(
          "assets/images/ted.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "idle",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.green,
          currentIndex: selectedPageIndex,
          onTap: selectPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.redAccent[400],
                icon: Icon(Icons.fastfood),
                title: Text("Meals")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("fav"))
          ]),
      appBar: AppBar(
        title: Text("Meal"),
      ),
    );
  }
}
